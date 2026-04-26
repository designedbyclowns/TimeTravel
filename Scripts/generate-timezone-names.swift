#!/usr/bin/env swift
// Regenerates Sources/TimeTravel/Public/TimeZone+Name.swift from the host
// platform's tzdata. Run when `TimeZoneTests.enumMatchesHostTimeZoneIdentifiers`
// fails:
//
//     swift Scripts/generate-timezone-names.swift > Sources/TimeTravel/Public/TimeZone+Name.swift
//
// The output is intentionally piped — the script writes to stdout and never
// modifies files itself.

import Foundation

func caseName(for identifier: String) -> String {
    let segments = identifier.split(separator: "/")
    var name = ""
    for (segmentIndex, segment) in segments.enumerated() {
        let words = segment.split(whereSeparator: { $0 == "_" || $0 == "-" })
        for (wordIndex, word) in words.enumerated() {
            let lower = word.lowercased()
            if segmentIndex == 0 && wordIndex == 0 {
                name += lower
            } else {
                name += lower.prefix(1).uppercased() + lower.dropFirst()
            }
        }
    }
    return name
}

let identifiers = TimeZone.knownTimeZoneIdentifiers.sorted()

var output = """
public import Foundation

extension TimeZone {
    /// Names of time zones known to the system.
    ///
    /// Timezones have unique names in the form "Area/Location", e.g. "America/New_York".
    ///
    /// Generated from `TimeZone.knownTimeZoneIdentifiers` by `Scripts/generate-timezone-names.swift`.
    public enum Name: String, CaseIterable, Sendable {

"""

for identifier in identifiers {
    output += "        /// \(identifier)\n"
    output += "        case \(caseName(for: identifier)) = \"\(identifier)\"\n"
}

output += """

        /// Area is the name of a continent, an ocean, or "Etc".
        ///
        /// The continents and oceans used are Africa, America, Antarctica,
        /// Arctic, Asia, Atlantic, Australia, Europe, Indian, and Pacific.
        ///
        /// The oceans are included since some islands are hard to connect to a certain continent.
        /// Some are geographically connected to one continent and politically to another.
        public var area: String {
            guard self != .gmt else { return "Etc" }
            return rawValue.components(separatedBy: "/").first ?? rawValue
        }

        /// Location is the name of a specific location within the area – usually a city or small island.
        ///
        /// Country names are not normally used in this scheme, primarily because they would not be robust,
        /// owing to frequent political and boundary changes. The names of large cities tend to be more permanent.
        public var location: String {
            rawValue.components(separatedBy: "/").last ?? rawValue
        }

        /// All the time zones areas known to the system.
        public static var allAreas: [String] {
            Set(allCases.map({ $0.area })).sorted()
        }
    }
}

extension TimeZone.Name: CustomStringConvertible {
    public var description: String {
        rawValue
    }
}

"""

print(output, terminator: "")
