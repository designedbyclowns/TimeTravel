public import Foundation

extension Calendar {
    /// Returns the instant that reads, in `timeZone`, as `date` reads in this calendar's time zone.
    ///
    /// The destination's own offset at that reading applies, so the result is right across a
    /// clock change. A reading the destination skips, such as 2:30 AM on the day its clocks go
    /// forward, moves forward to the first that exists; one it repeats is its first occurrence.
    ///
    /// - Parameters:
    ///   - timeZone: The time zone to set the date to.
    ///   - date: The starting date.
    /// - Returns: A new date, or nil if a date could not be calculated with the given input.
    public func date(
        bySettingTimeZone timeZone: TimeZone,
        of date: Date
    ) -> Date? {
        guard timeZone != self.timeZone else { return date }
        let components = dateComponents([.era, .year, .month, .day, .hour, .minute, .second, .nanosecond], from: date)
        var destination = self
        destination.timeZone = timeZone
        return destination.date(from: components)
    }
}
