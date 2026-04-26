public import Foundation

extension TimeZone {
    /// Returns a time zone initialized with a ``TimeZone.Name`.
    public init?(name: TimeZone.Name) {
        guard let tz = TimeZone(identifier: name.rawValue) else { return nil }
        self = tz
    }
    
    /// The difference in seconds between this and the provided time zone.
    /// - Parameters:
    ///   - other: The other time zone to use for the calculation.
    ///   - date: The date to use for the calculation. The default value is the current date.
    /// - Returns: A `TimeInterval` representation of the difference in seconds.
    @available(*, deprecated, message: "Use secondsFromTimeZone(_:forDate:) and convert to TimeInterval at the call site if needed.")
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
