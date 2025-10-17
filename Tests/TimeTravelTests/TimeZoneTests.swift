import Foundation
import Testing
@testable import TimeTravel

struct TimeZoneTests {

    @Test func initWithName() {
        TimeZone.Name.allCases.forEach {
            if TimeZone(name: $0) == nil {
                Issue.record("Failed to initialize TimeZone with name: \($0)")
            }
        }
    }
    
    @Test(arguments: [
        (TimeZone.Name.gmt, -28800),
        (TimeZone.Name.americaNewYork, -10800),
        (TimeZone.Name.pacificTahiti, 7200),
        (TimeZone.Name.asiaKatmandu, -48600),
        (TimeZone.Name.africaMogadishu, -39600)
    ]) func timeIntervalFromTimeZone(arg: (TimeZone.Name, TimeInterval)) throws {
        let timeZone = try #require(TimeZone(name: .americaLosAngeles))
        let otherTimeZone = try #require(TimeZone(name: arg.0))
        let secondsFromTimeZone = timeZone.timeIntervalFromTimeZone(otherTimeZone, forDate: Date.explodingWhaleDay)
        #expect(secondsFromTimeZone == arg.1)
    }
    
    @Test(arguments: [
        (TimeZone.Name.gmt, -28800),
        (TimeZone.Name.americaNewYork, -10800),
        (TimeZone.Name.pacificTahiti, 7200),
        (TimeZone.Name.asiaKatmandu, -48600),
        (TimeZone.Name.africaMogadishu, -39600)
    ]) func secondsFromTimeZone(arg: (TimeZone.Name, Int)) throws {
        let timeZone = try #require(TimeZone(name: .americaLosAngeles))
        let otherTimeZone = try #require(TimeZone(name: arg.0))
        let secondsFromTimeZone = timeZone.secondsFromTimeZone(otherTimeZone, forDate: Date.explodingWhaleDay)
        #expect(secondsFromTimeZone == arg.1)
    }
}


