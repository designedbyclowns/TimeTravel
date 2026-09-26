public import Foundation

/// A day on the calendar, which is the same day wherever it's read.
///
/// A `Date` is an instant, so the day it falls on depends on where it's read: 11 PM in Los
/// Angeles is already tomorrow in Tokyo. Some dates are days rather than instants — when work
/// was done, when something falls due, a birthday — and those shouldn't move when someone
/// crosses a time zone. A `CalendarDay` is that day.
///
/// Convert at the edges, naming the time zone each time: ``init(_:in:)`` for the day an instant
/// falls on, and ``start(in:)`` for the instant a day begins, to show it or edit it in a date
/// picker.
///
/// ```swift
/// let losAngeles = TimeZone(name: .americaLosAngeles)!
/// let tokyo = TimeZone(name: .asiaTokyo)!
///
/// let day = CalendarDay(.explodingWhaleDay, in: losAngeles)  // 1970-11-12
/// CalendarDay(.explodingWhaleDay, in: tokyo)                 // 1970-11-13
/// day.start(in: tokyo)                                        // midnight on the 12th in Tokyo
/// ```
///
/// Days are Gregorian, whatever calendar a device uses. To store one, use
/// ``daysSinceReferenceDate``; it encodes as `yyyy-MM-dd`.
public struct CalendarDay: Hashable, Comparable, Sendable {

    /// The number of days since 1 January 2001, Foundation's reference date.
    ///
    /// Negative for earlier days. Days order as their counts do, so a store can sort and filter
    /// on this with nothing to convert.
    public let daysSinceReferenceDate: Int

    /// Creates the day a given number of days after 1 January 2001, or before it when negative.
    public init(daysSinceReferenceDate: Int) {
        self.daysSinceReferenceDate = daysSinceReferenceDate
    }

    /// The day an instant falls on in a time zone.
    ///
    /// - Parameters:
    ///   - date: The instant.
    ///   - timeZone: Where the instant is read.
    public init(_ date: Date, in timeZone: TimeZone) {
        let components = Self.gregorian(in: timeZone).dateComponents([.era, .year, .month, .day], from: date)
        // The same calendar date, rebuilt in UTC, where every day is exactly as long.
        let midnightUTC = Self.gregorian(in: Self.utc).date(from: components) ?? date
        daysSinceReferenceDate = Int((midnightUTC.timeIntervalSinceReferenceDate / Self.secondsPerDay).rounded(.down))
    }

    /// The given day in the Gregorian calendar, or `nil` if it has no such day.
    public init?(year: Int, month: Int, day: Int) {
        let components = DateComponents(calendar: Self.gregorian(in: Self.utc), year: year, month: month, day: day)
        guard components.isValidDate, let date = components.date else { return nil }
        self.init(date, in: Self.utc)
    }

    /// The current day in a time zone.
    public static func today(in timeZone: TimeZone) -> CalendarDay {
        CalendarDay(Date(), in: timeZone)
    }

    /// The instant this day begins in a time zone.
    ///
    /// A day whose midnight a clock change skips begins at the first instant it has.
    public func start(in timeZone: TimeZone) -> Date {
        let components = Self.gregorian(in: Self.utc).dateComponents([.era, .year, .month, .day], from: midnightUTC)
        return Self.gregorian(in: timeZone).date(from: components) ?? midnightUTC
    }

    /// The day a number of days after this one, or before it when `days` is negative.
    public func adding(days: Int) -> CalendarDay {
        CalendarDay(daysSinceReferenceDate: daysSinceReferenceDate + days)
    }

    public static func < (lhs: CalendarDay, rhs: CalendarDay) -> Bool {
        lhs.daysSinceReferenceDate < rhs.daysSinceReferenceDate
    }

    // MARK: - Private

    private static let secondsPerDay: TimeInterval = 24 * 60 * 60

    // `TimeZone.gmt` needs macOS 13 and iOS 16. An offset of zero always makes a time zone.
    fileprivate static let utc = TimeZone(secondsFromGMT: 0)!

    private var midnightUTC: Date {
        Date(timeIntervalSinceReferenceDate: TimeInterval(daysSinceReferenceDate) * Self.secondsPerDay)
    }

    private static func gregorian(in timeZone: TimeZone) -> Calendar {
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = timeZone
        return calendar
    }

    /// Reads and writes a day as `yyyy-MM-dd`.
    fileprivate static var format: Date.ISO8601FormatStyle {
        Date.ISO8601FormatStyle(timeZone: Self.utc).year().month().day()
    }
}

// MARK: - CustomStringConvertible

extension CalendarDay: CustomStringConvertible {
    /// The day written `yyyy-MM-dd`.
    public var description: String {
        midnightUTC.formatted(Self.format)
    }
}

// MARK: - Codable

extension CalendarDay: Codable {
    /// Reads a day written `yyyy-MM-dd`.
    ///
    /// - Throws: `DecodingError.dataCorrupted` if the value is in another form, or names a day
    ///   the calendar doesn't have.
    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        let text = try container.decode(String.self)
        guard let date = try? Self.format.parse(text),
              // Written back out and compared, so a day that parsing rolls over — 30 February
              // becoming 2 March — is refused rather than read as another.
              date.formatted(Self.format) == text
        else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "'\(text)' is not a day written yyyy-MM-dd."
            )
        }
        self.init(date, in: Self.utc)
    }

    /// Writes the day as `yyyy-MM-dd`.
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(description)
    }
}
