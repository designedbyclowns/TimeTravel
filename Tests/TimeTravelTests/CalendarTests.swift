import Foundation
import Testing
@testable import TimeTravel

struct CalendarTests {
    @Test(arguments: [
        (TimeZone.Name.gmt, 8.0),
        (TimeZone.Name.americaNewYork, 3.0),
        (TimeZone.Name.pacificTahiti, -2.0),
        (TimeZone.Name.asiaKatmandu, 13.5),
        (TimeZone.Name.africaMogadishu, 11.0)
    ]) func dateBySettingTimeZone(arg: (TimeZone.Name, TimeInterval)) throws {
        let newTimeZone = try #require(TimeZone(name: arg.0))

        let sourceTimeZone = try #require(TimeZone(name: .americaLosAngeles))
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = sourceTimeZone

        let date = Date.explodingWhaleDay

        let newDate = try #require(calendar.date(bySettingTimeZone: newTimeZone, of: date))

        let delta = date.timeIntervalSinceReferenceDate - newDate.timeIntervalSinceReferenceDate
        expectEqual(delta, arg.1.hours)
    }

    @Test func sameTimeZoneIsIdentity() throws {
        let tz = try #require(TimeZone(name: .americaLosAngeles))
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = tz

        let date = Date.explodingWhaleDay
        let result = try #require(calendar.date(bySettingTimeZone: tz, of: date))
        #expect(result == date)
    }
}
