import Foundation
import Testing
@testable import TimeTravel

struct TimeZoneTests {

    @Test(arguments: TimeZone.Name.allCases)
    func initWithName(name: TimeZone.Name) {
        #expect(TimeZone(name: name) != nil)
    }

    /// Catches drift between the generated `TimeZone.Name` enum and the
    /// host platform's tzdata. Regenerate via `swift Scripts/generate-timezone-names.swift`.
    @Test func enumMatchesHostTimeZoneIdentifiers() {
        let enumIdentifiers = Set(TimeZone.Name.allCases.map(\.rawValue))
        let systemIdentifiers = Set(TimeZone.knownTimeZoneIdentifiers)

        let missingFromEnum = systemIdentifiers.subtracting(enumIdentifiers).sorted()
        let extraInEnum = enumIdentifiers.subtracting(systemIdentifiers).sorted()

        #expect(missingFromEnum.isEmpty, "TimeZone.Name is missing host identifiers: \(missingFromEnum)")
        #expect(extraInEnum.isEmpty, "TimeZone.Name has identifiers not present on host: \(extraInEnum)")
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

    @Test func sameTimeZoneIsZero() throws {
        let la = try #require(TimeZone(name: .americaLosAngeles))
        #expect(la.secondsFromTimeZone(la, forDate: Date.explodingWhaleDay) == 0)
    }
}


