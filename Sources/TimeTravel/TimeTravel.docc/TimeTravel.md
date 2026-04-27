# ``TimeTravel``

Foundation extensions for re-anchoring a `Date` to a different `TimeZone`.

## Overview

A `Date` is an absolute point in time — it carries no time zone of its own. That's the right model for "when did this happen", but the wrong model when the wall-clock value is the truth: a photo's 6 AM Tokyo timestamp, a diary entry in the author's local time, a train departing at 8 AM Paris time, or a test assertion that shouldn't drift between a developer's laptop and CI.

``TimeTravel`` re-anchors a `Date` to a new time zone — the underlying instant shifts so the wall-clock reading travels with it. The source time zone needs to be captured alongside the date; ``TimeTravel`` can't infer it from the absolute instant alone.

```swift
import TimeTravel

let date = Date.explodingWhaleDay  // 1970-11-12 15:45 in Florence, Oregon

var calendar = Calendar(identifier: .gregorian)
calendar.timeZone = TimeZone(identifier: "America/Los_Angeles")!

let nyc = TimeZone(identifier: "America/New_York")!
let shifted = date.inTimeZone(nyc, calendar: calendar)!
// In NYC, `shifted` reads 15:45 — the same wall-clock value, re-anchored.
```

## Topics

### Shifting dates between time zones

- ``Foundation/Date/inTimeZone(_:calendar:)``
- ``Foundation/Calendar/date(bySettingTimeZone:of:)``

### Time zone offsets

- ``Foundation/TimeZone/secondsFromTimeZone(_:forDate:)``

### Time zone identifiers

- ``Foundation/TimeZone/init(name:)``
- ``Foundation/TimeZone/Name``

### Test fixtures

- ``Foundation/Date/explodingWhaleDay``

### Deprecated

- ``Foundation/TimeZone/timeIntervalFromTimeZone(_:forDate:)``

## See Also

- [Your Calendrical Fallacy Is…](https://yourcalendricalfallacyis.com) — a quick tour of calendar and date assumptions that quietly break: leap seconds, time zones that change offset, calendars that disagree on what year it is.
