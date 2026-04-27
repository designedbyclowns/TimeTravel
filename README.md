[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fdesignedbyclowns%2FTimeTravel%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/designedbyclowns/TimeTravel)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fdesignedbyclowns%2FTimeTravel%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/designedbyclowns/TimeTravel)

# TimeTravel

Re-anchor a `Date` to a new time zone — the underlying instant shifts so the wall-clock reading travels with it.

Swift's `Date` is just an absolute instant — it carries no time zone of its own. That's the right model for "when did this happen", but the wrong model for cases where the wall-clock value is the truth:

- **Photos.** A photo taken at 6 AM in Tokyo should read as 6 AM whether the viewer is in Tokyo, New York, or Reykjavík.
- **Journals & diaries.** An entry should display in the author's local time, not the reader's.
- **Travel itineraries.** A train departing at 8 AM Paris time should read as 8 AM whether you're checking the schedule from London or LA.
- **Deterministic tests.** The same date assertion shouldn't pass on a developer's laptop and fail in CI.

In each case, the source time zone needs to be captured alongside the date — TimeTravel can't infer it from the absolute instant alone.

## Usage

```swift
import TimeTravel

var calendar = Calendar(identifier: .gregorian)
calendar.timeZone = TimeZone(identifier: "America/Los_Angeles")!

let nyc = TimeZone(identifier: "America/New_York")!
let date = Date.explodingWhaleDay                        // 3:45 PM Pacific
let shifted = date.inTimeZone(nyc, calendar: calendar)!  // 3:45 PM Eastern
```

The `calendar` argument declares the *source* time zone — the frame in which `date` should be read. There's no default by design: `Calendar.current` would tie the result to the host machine, which is the non-determinism this library exists to avoid.

## Anatomy of a date shift

To see what's actually happening, it helps to format the same date in two time zones with [`Date.FormatStyle`](https://developer.apple.com/documentation/foundation/date/formatstyle):

```swift
let westCoastStyle = Date.FormatStyle(
    date: .complete,
    time: .complete,
    calendar: Calendar(identifier: .gregorian),
    timeZone: TimeZone(identifier: "America/Los_Angeles")!
)

let eastCoastStyle = Date.FormatStyle(
    date: .complete,
    time: .complete,
    calendar: Calendar(identifier: .gregorian),
    timeZone: TimeZone(identifier: "America/New_York")!
)
```

Format styles don't change the date — they only change how it's rendered. The same instant reads differently in each time zone:

```swift
let date = Date.explodingWhaleDay

westCoastStyle.format(date)
// "Thursday, 12 November 1970 at 3:45:00 PM GMT-8"

eastCoastStyle.format(date)
// "Thursday, November 12, 1970 at 18:45:00 EST"
```

To re-anchor the date so the wall-clock reading travels with it, use `inTimeZone(_:calendar:)`:

```swift
let nyc = TimeZone(identifier: "America/New_York")!
let shifted = date.inTimeZone(nyc, calendar: calendar)!

date.timeIntervalSince1970     // 27,301,500
shifted.timeIntervalSince1970  // 27,290,700  (three hours earlier)

westCoastStyle.format(shifted)
// "Thursday, November 12, 1970 at 12:45:00 PM PST"

eastCoastStyle.format(shifted)
// "Thursday, November 12, 1970 at 3:45:00 PM EST"
```

The underlying instant moved by three hours, so the new wall-clock reading in NYC matches the original wall-clock reading in Florence, Oregon.

### Why this isn't built in

Apple's [`TimeZone`](https://developer.apple.com/documentation/foundation/timezone) docs note that "Cocoa does not provide any API to change the time zone of the computer, or of other applications." Combined with `Date`'s zone-less model, that makes deterministic time-zone shifts awkward — this library smooths over the gap.

## Installation

Add the package as a dependency in your Package.swift file

```swift
let package = Package(
    name: "Foo",
    // name, platforms, products, etc.
    dependencies: [
        .package(url: "https://github.com/designedbyclowns/TimeTravel", .upToNextMinor(from: "0.1.0")),
    ],
    targets: [
        .target(name: "Foo", dependencies: [
            .product(name: "TimeTravel", package: "TimeTravel"),
        ]),
    ]
)
```

## Further reading

Calendars and dates are full of edge cases that look obvious until they aren't. For a quick tour of the assumptions that quietly break — leap seconds, time zones that change offset, calendars that disagree on what year it is — see [Your Calendrical Fallacy Is…](https://yourcalendricalfallacyis.com).
