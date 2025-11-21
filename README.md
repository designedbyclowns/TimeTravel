# TimeTravel

This package provides some extensions to change the time zone of a date.

## Overview

When we use dates in a general sense, we are typically using them to reference a date and time, *in a specific location*.

For example when making a hotel reservation, the check-in time is in reference to that date and time in the local time where the hotel is located, which may not be the same as yours.

The [Date](https://developer.apple.com/documentation/foundation/date) type is described as 

> A Date value encapsulate a single point in time, independent of any particular calendrical system or time zone. Date values represent a time interval relative to an absolute reference date.

Additionally the [TimeZone](https://developer.apple.com/documentation/foundation/timezone) documentation includes this important statement:

> Cocoa does not provide any API to change the time zone of the computer, or of other applications.

This makes it tricky to compare dates in unit tests, as the tests need to pass or fail regardless of what time zone of the system the tests are running on.


One approach is to create a new date as if it was created in that time zone. Which is what this library provides.


## Usage

To illustrate this its helpful to use a historical event with a known date and time zone. ``Date.explodingWhaleDay`` works nicely.

To make it a little easier to read these dates we can create a `Date/FormatStyle` with a specific time zone. 

```swift
let westCoastStyle = Date.FormatStyle(
    date: .complete,
    time: .complete,
    calendar: Calendar(identifier: .gregorian),
    timeZone: TimeZone(identifier: "America/Los_Angeles")!
)
```

The westCoatFormat style uses the same time zone as the date we are using because thats the time zone of Florence, Oregon in the US where the dead whale was dynamited.

```swift
import TimeTravel

let date = Date.explodingWhaleDay

westCoastStyle.format(Date.explodingWhaleDay)
// "Thursday, 12 November 1970 at 3:45:00 PM GMT-8"
```

To simulate how this would look to someone on the east cost of the US, we can create another `Date/FormatStyle`, using a different time zone:

```swift
let eastCoastStyle = Date.FormatStyle(
    date: .complete,
    time: .complete,
    calendar: Calendar(identifier: .gregorian),
    timeZone: TimeZone(identifier: "America/New_York")!
)

eastCoastStyle.format(Date.explodingWhaleDay)
// "Thursday, November 12, 1970 at 18:45:00 EST"
```

Importantly, the formatters don't change the actual date in any way, they merely affects how the dates are represented as strings.

But what if we want to actually change the time zone of the date?

```swift
import TimeTravel

let date = Date.explodingWhaleDay
date.timeIntervalSince1970
// 27,301,500

let calendar = Calendar(identifier: .gregorian)
let newTimeZone = TimeZone(identifier: "America/New_York")!

let newDate = calendar.date(bySettingTimeZone timeZone: newTimeZone, of date: Date)

newDate.timeIntervalSince1970
// 27,290,700.0

westCoastStyle.format(newDate)
// Thursday, November 12, 1970 at 12:45:00 PST

eastCoastStyle.format(newDate)
// "Thursday, November 12, 1970 at 15:45:00 EST"

or 

let newDate2 = date.inTimeZone(newTimeZone, calendar: calendar)

newDate2.timeIntervalSince1970
// 27,290,700.0

westCoastStyle.format(newDate2)
// Thursday, November 12, 1970 at 12:45:00 PST

eastCoastStyle.format(newDate2)
// "Thursday, November 12, 1970 at 15:45:00 EST"

```

Notice that the Date has now changed by 3 hours.


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
