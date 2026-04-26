# ``TimeTravel``

Foundation extensions for re-anchoring a `Date` to a different `TimeZone`.

## Overview

A `Date` is an absolute point in time, independent of any calendar or time zone. But everyday dates — a check-in time, a calendar event, a deadline — are wall-clock values *in a specific place*. ``TimeTravel`` provides extensions that compute the offset between two time zones at a given instant and shift the date accordingly, so you can deterministically re-anchor a wall-clock value from one zone to another.

This is most useful in tests, where the host machine's time zone would otherwise leak into results.

```swift
import TimeTravel

let date = Date.explodingWhaleDay  // 1970-11-12 15:45 in Florence, Oregon

var calendar = Calendar(identifier: .gregorian)
calendar.timeZone = TimeZone(identifier: "America/Los_Angeles")!

let nyc = TimeZone(identifier: "America/New_York")!
let shifted = date.inTimeZone(nyc, calendar: calendar)!
// shifted's wall-clock in NYC is 15:45 — the same wall-clock value, re-anchored.
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

## Further reading

Calendars and dates are full of edge cases that look obvious until they aren't. For a quick tour of the assumptions that quietly break — leap seconds, time zones that change offset, calendars that disagree on what year it is — see [Your Calendrical Fallacy Is…](https://yourcalendricalfallacyis.com).
