public import Foundation

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
    
    /**
     A stable date and time comes in handy when testing date functions. This Seems as good as any.
     
     A widely reported case of an exploding whale occurred in Florence, Oregon, in November 1970, when the Oregon Highway Division (now the Oregon Department of Transportation) blew up a decaying sperm whale with dynamite in an attempt to dispose of its rotting carcass. The explosion threw whale flesh around 800 feet (240 meters) away, and its odor lingered for some time.
     
     [Watch on YouTube](https://www.youtube.com/watch?v=V6CLumsir34).
     
     🐋 You're welcome. 💣
     */
    public static let explodingWhaleDay = DateComponents(
        calendar: Calendar(identifier: .gregorian),
        timeZone: TimeZone(identifier: "America/Los_Angeles"),
        year: 1970,
        month: 11,
        day: 12,
        hour: 15,
        minute: 45,
        second: 0
    ).date!
}

