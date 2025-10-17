import Foundation

extension Date {
    /**
     A stable date and time comes in handy when testing date functions. This Seems as good as any.
     
     A widely reported case of an exploding whale occurred in Florence, Oregon, in November 1970, when the Oregon Highway Division (now the Oregon Department of Transportation) blew up a decaying sperm whale with dynamite in an attempt to dispose of its rotting carcass. The explosion threw whale flesh around 800 feet (240 meters) away, and its odor lingered for some time.
     
     [Watch on YouTube](https://www.youtube.com/watch?v=V6CLumsir34).
     
     🐋 You're welcome. 💣
     */
    static let explodingWhaleDay = DateComponents(
        calendar: Calendar(identifier: .gregorian),
        timeZone: TimeZone(identifier: "America/Los_Angeles"),
        year: 1970,
        month: 11,
        day: 20,
        hour: 12,
        minute: 34,
        second: 56
    ).date!
}
