public import Foundation

extension Calendar {
    /// Returns a new Date representing the date calculated by updating the time zone.
    /// - Parameters:
    ///   - timeZone: The time zone to set the date to.
    ///   - date: The starting date.
    /// - Returns: A new date, or nil if a date could not be calculated with the given input.
    public func date(
        bySettingTimeZone timeZone: TimeZone,
        of date: Date
    ) -> Date? {
        let seconds = self.timeZone.secondsFromTimeZone(timeZone, forDate: date)
        return self.date(byAdding: .second, value: seconds, to: date)
    }
}

extension TimeZone {
    
    /// Returns a time zone initialized with a ``TimeZone.Name``.
    public init?(name: TimeZone.Name) {
        guard let tz = TimeZone(identifier: name.rawValue) else { return nil }
        self = tz
    }
    
    /// The difference in seconds between this and the provided time zone.
    /// - Parameters:
    ///   - other: The other time zone to use for the calculation.
    ///   - date: The date to use for the calculation. The default value is the current date.
    /// - Returns: A `TimeInterval` representation of the difference in seconds.
    public func timeIntervalFromTimeZone(_ other: TimeZone, forDate date: Date = Date()) -> TimeInterval {
        TimeInterval(secondsFromTimeZone(other, forDate: date))
    }
    
    
    /// The difference in seconds between this and the provided time zone.
    /// - Parameters:
    ///   - other: The other time zone to use for the calculation.
    ///   - date: The date to use for the calculation. The default value is the current date.
    /// - Returns: An integer representation of the difference in seconds.
    public func secondsFromTimeZone(_ other: TimeZone, forDate date: Date = Date()) -> Int {
        self.secondsFromGMT(for: date) - other.secondsFromGMT(for: date)
    }
}

extension Date {
    /// Returns a new `Date` representing the date calculated by updating the time zone.
    /// - Parameters:
    ///   - timeZone: The time zone to set the date to.
    ///   - calendar: The `Calendar` to use for the calculation. The default value is the current calendar.
    /// - Returns: A new date, or nil if a date could not be calculated with the given input.
    public func inTimeZone(_ timeZone: TimeZone, calendar: Calendar = .current) -> Date? {
        let delta = calendar.timeZone.secondsFromTimeZone(timeZone, forDate: self)
        return calendar.date(byAdding: .second, value: delta, to: self)
    }
}

extension TimeInterval {
    var seconds: TimeInterval { self }
    var minutes: TimeInterval { self * 60.0 }
    var hours: TimeInterval { self * 60.0 * 60.0 }
}

extension Int {
    var seconds: TimeInterval { TimeInterval(self).seconds }
    var minutes: TimeInterval { TimeInterval(self).minutes }
    var hours: TimeInterval { TimeInterval(self).hours }
}
