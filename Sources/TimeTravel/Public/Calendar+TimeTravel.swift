public import Foundation

extension Calendar {
    /// Returns a new `Date` representing the date calculated by updating the time zone.
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
