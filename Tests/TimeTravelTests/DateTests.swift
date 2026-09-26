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
        expectEqual(delta, arg.1.hours)
    }

    @Test func sameTimeZoneIsIdentity() throws {
        let tz = try #require(TimeZone(name: .americaLosAngeles))
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = tz

        let date = Date.explodingWhaleDay
        let result = try #require(date.inTimeZone(tz, calendar: calendar))
        #expect(result == date)
    }

    /// The reading is kept in the destination with the destination's own offset at that
    /// reading. Across a clock change that differs from its offset at the original instant; a
    /// reading it skips moves forward, and one it repeats is its first occurrence.
    @Test(arguments: [
        // An ordinary day in standard time.
        (reading: [2022, 1, 15, 12, 0], utc: [20, 0]),
        // 3:30 AM on the morning LA springs forward is already daylight time, though the
        // instant 3:30 AM GMT is still the evening before in standard time.
        ([2022, 3, 13, 3, 30], [10, 30]),
        // 2:30 AM that morning doesn't exist in LA, so it moves forward to 3:30.
        ([2022, 3, 13, 2, 30], [10, 30]),
        // 1:30 AM on the morning LA falls back happens twice; the first is in daylight time.
        ([2022, 11, 6, 1, 30], [8, 30]),
    ])
    func theReadingIsKeptWithTheDestinationsOffset(reading: [Int], utc: [Int]) throws {
        let gmt = try #require(TimeZone(name: .gmt))
        let la = try #require(TimeZone(name: .americaLosAngeles))
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = gmt
        let date = try #require(DateComponents(
            calendar: calendar, timeZone: gmt,
            year: reading[0], month: reading[1], day: reading[2], hour: reading[3], minute: reading[4]
        ).date)

        let shifted = try #require(date.inTimeZone(la, calendar: calendar))

        let found = calendar.dateComponents([.hour, .minute], from: shifted)
        #expect([found.hour, found.minute] == [utc[0], utc[1]])
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

        expectEqual(standardShift, 8.hours)
        expectEqual(daylightShift, 7.hours)
    }
}
