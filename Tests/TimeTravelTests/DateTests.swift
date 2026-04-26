import Foundation
import Testing
@testable import TimeTravel

struct DateTests {

    @Test(arguments: [
        (TimeZone.Name.americaNewYork, 3.0),
        (TimeZone.Name.pacificTahiti, -2.0),
        (TimeZone.Name.asiaKatmandu, 13.5),
        (TimeZone.Name.africaMogadishu, 11.0)
    ]) func dateBySettingTimeZone(arg: (TimeZone.Name, TimeInterval)) throws {

        let date = Date.explodingWhaleDay

        let sourceTimeZone = try #require(TimeZone(name: .americaLosAngeles))
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = sourceTimeZone

        let newTimeZone = try #require(TimeZone(name: arg.0))

        let newDate = try #require(date.inTimeZone(newTimeZone, calendar: calendar))

        let delta = date.timeIntervalSinceReferenceDate - newDate.timeIntervalSinceReferenceDate
        #expect(expectEqual(delta, arg.1.hours))
    }

    @Test func sameTimeZoneIsIdentity() throws {
        let tz = try #require(TimeZone(name: .americaLosAngeles))
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = tz

        let date = Date.explodingWhaleDay
        let result = try #require(date.inTimeZone(tz, calendar: calendar))
        #expect(result == date)
    }

    /// LA→GMT offset differs by an hour between standard time and DST. The
    /// computation must use the offset *at the input instant*, not a fixed value.
    @Test func dstAffectsResult() throws {
        let la = try #require(TimeZone(name: .americaLosAngeles))
        let gmt = try #require(TimeZone(name: .gmt))
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = la

        let standard = try #require(DateComponents(
            calendar: calendar, timeZone: la,
            year: 2022, month: 1, day: 15, hour: 12
        ).date)
        let daylight = try #require(DateComponents(
            calendar: calendar, timeZone: la,
            year: 2022, month: 7, day: 15, hour: 12
        ).date)

        let standardShift = standard.timeIntervalSince(try #require(standard.inTimeZone(gmt, calendar: calendar)))
        let daylightShift = daylight.timeIntervalSince(try #require(daylight.inTimeZone(gmt, calendar: calendar)))

        #expect(expectEqual(standardShift, 8.hours))
        #expect(expectEqual(daylightShift, 7.hours))
    }
}
