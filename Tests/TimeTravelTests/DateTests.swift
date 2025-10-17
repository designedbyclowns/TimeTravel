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
        var calendar = Calendar.init(identifier: .gregorian)
        calendar.timeZone = sourceTimeZone
        
        let newTimeZone = try #require(TimeZone(name: arg.0))
        
        let newDate = try #require(date.inTimeZone(newTimeZone, calendar: calendar))
    
        let delta = date.timeIntervalSinceReferenceDate - newDate.timeIntervalSinceReferenceDate
        #expect(delta == arg.1.hours)
    }
}
