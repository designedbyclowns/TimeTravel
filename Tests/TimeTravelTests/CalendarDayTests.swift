import Foundation
import Testing
@testable import TimeTravel

struct CalendarDayTests {

    // MARK: - Making a day

    /// Only days the Gregorian calendar has are days.
    @Test(arguments: [
        (year: 2025, month: 2, day: 30),
        (2025, 13, 1),
        (2025, 0, 1),
        (2025, 1, 0),
        (2023, 2, 29),
    ])
    func aDayTheCalendarDoesNotHaveIsNotOne(year: Int, month: Int, day: Int) {
        let made: CalendarDay? = CalendarDay(year: year, month: month, day: day)
        #expect(made == nil)
    }

    /// The whale went up at 3:45 PM in Oregon, which was already the next morning in Tokyo and
    /// Auckland, so one instant falls on the day of wherever it's read.
    @Test(arguments: [
        (TimeZone.Name.americaLosAngeles, "1970-11-12"),
        (TimeZone.Name.pacificHonolulu, "1970-11-12"),
        (TimeZone.Name.asiaTokyo, "1970-11-13"),
        (TimeZone.Name.pacificAuckland, "1970-11-13"),
    ])
    func anInstantFallsOnTheDayOfWhereItIsRead(zone: TimeZone.Name, expected: String) throws {
        let timeZone = try #require(TimeZone(name: zone))

        #expect(CalendarDay(.explodingWhaleDay, in: timeZone).description == expected)
    }

    // MARK: - Reading a day

    /// A day keeps its date wherever it's read, rather than drifting a day either way.
    @Test(arguments: [TimeZone.Name.americaLosAngeles, .pacificHonolulu, .asiaTokyo, .pacificKiritimati])
    func aDayStartsOnItsOwnDateWhereverItIsRead(zone: TimeZone.Name) throws {
        let timeZone = try #require(TimeZone(name: zone))
        let day = try #require(CalendarDay(year: 2025, month: 1, day: 15))

        let start = day.start(in: timeZone)

        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = timeZone
        let found = calendar.dateComponents([.year, .month, .day, .hour], from: start)
        #expect([found.year, found.month, found.day, found.hour] == [2025, 1, 15, 0])
        #expect(CalendarDay(start, in: timeZone) == day, "and reads back as the same day")
    }

    /// Santiago skipped midnight on 8 September 2024, so that day begins at 1 AM rather than on
    /// the day before.
    @Test func aDayWhoseMidnightIsSkippedBeginsAtItsFirstInstant() throws {
        let santiago = try #require(TimeZone(name: .americaSantiago))
        let day = try #require(CalendarDay(year: 2024, month: 9, day: 8))

        let start = day.start(in: santiago)

        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = santiago
        let found = calendar.dateComponents([.day, .hour], from: start)
        #expect([found.day, found.hour] == [8, 1])
    }

    // MARK: - Arithmetic and order

    @Test(arguments: [
        (from: [2025, 1, 31], days: 1, to: [2025, 2, 1]),
        ([2024, 2, 28], 1, [2024, 2, 29]),
        ([2025, 12, 31], 1, [2026, 1, 1]),
        ([2025, 3, 1], -1, [2025, 2, 28]),
        ([2025, 1, 15], 365, [2026, 1, 15]),
        // Across a clock change, where adding 24-hour spans to an instant would lose a day.
        ([2025, 3, 8], 2, [2025, 3, 10]),
    ])
    func addingDaysLandsOnTheCalendarDay(from: [Int], days: Int, to: [Int]) throws {
        let start = try #require(CalendarDay(year: from[0], month: from[1], day: from[2]))
        let expected = try #require(CalendarDay(year: to[0], month: to[1], day: to[2]))

        #expect(start.adding(days: days) == expected)
    }

    /// A day's count is days since the reference date, 1 January 2001, and orders as the days do.
    @Test(arguments: [
        (day: [2000, 12, 31], count: -1),
        ([2001, 1, 1], 0),
        ([2001, 1, 2], 1),
        ([2025, 1, 1], 8_766),
    ])
    func aDayCountsFromTheReferenceDate(day: [Int], count: Int) throws {
        let made = try #require(CalendarDay(year: day[0], month: day[1], day: day[2]))

        #expect(made.daysSinceReferenceDate == count)
        #expect(CalendarDay(daysSinceReferenceDate: count) == made)
    }

    @Test func daysOrderAsTheCalendarDoes() throws {
        let days = try [(2024, 12, 31), (2025, 1, 1), (2025, 1, 2), (2025, 2, 1)].map {
            try #require(CalendarDay(year: $0.0, month: $0.1, day: $0.2))
        }

        #expect(days.shuffled().sorted() == days)
    }

    // MARK: - Encoding

    /// A day is written as the day and nothing else, so nothing reading it can move it.
    @Test func aDayIsWrittenAsYearMonthDay() throws {
        let day = try #require(CalendarDay(year: 1_970, month: 1, day: 2))

        let json = try JSONEncoder().encode(["day": day])

        #expect(String(decoding: json, as: UTF8.self) == #"{"day":"1970-01-02"}"#)
        #expect(try JSONDecoder().decode([String: CalendarDay].self, from: json)["day"] == day)
    }

    /// Only `yyyy-MM-dd` is a day: not a time, not another layout, and not a day the calendar
    /// lacks.
    @Test(arguments: ["2025-01-15T12:00:00Z", "25-01-15", "15/01/2025", "2025-02-30", ""])
    func textThatIsNotYearMonthDayIsRefused(text: String) {
        let json = Data(#"{"day": "\#(text)"}"#.utf8)

        let error = #expect(throws: DecodingError.self) {
            try JSONDecoder().decode([String: CalendarDay].self, from: json)
        }
        guard case .dataCorrupted = error else {
            Issue.record("expected the value to be refused as corrupt, got \(String(describing: error))")
            return
        }
    }
}
