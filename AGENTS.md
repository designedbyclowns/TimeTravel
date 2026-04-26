# AGENTS.md

This file provides guidance to coding agents working in this repository.

## Project

`TimeTravel` is a small Swift Package (swift-tools 6.2) that provides Foundation extensions for re-anchoring a `Date` to a different `TimeZone`. The core operation is computing a delta between two zones for a given instant and adding it as seconds — this intentionally produces a *different* point in time, not just a different rendering. See `Sources/TimeTravel/Public/Calendar+TimeTravel.swift` and `Date+TimeTravel.swift`.

## Commands

```sh
swift build                              # build the library
swift test                               # run all tests (Swift Testing)
swift test --filter TimeZoneTests        # run a single test suite
swift test --filter TimeZoneTests/initWithName   # run a single test
```

CI (`.github/workflows/swift.yml`) runs `swift build` and `swift test` on `macos-latest` against pushes/PRs to `main`.

## Architecture notes

- **`InternalImportsByDefault` is enabled** (see `Package.swift`). Files in `Sources/TimeTravel/Public/` that expose Foundation types in their public API must use `public import Foundation`, not plain `import Foundation`.
- **`Date.inTimeZone(_:calendar:)` requires an explicit calendar** — there is intentionally no default. The calendar's `timeZone` is the *source* frame for the date being shifted; defaulting to `Calendar.current` would make results host-dependent, which is the bug the package exists to prevent.
- **`TimeZone.Name` (`Public/TimeZone+Name.swift`) is generated** by `Scripts/generate-timezone-names.swift` from `TimeZone.knownTimeZoneIdentifiers`. Do not hand-edit case names. To regenerate after a platform tzdata change:
  ```sh
  swift Scripts/generate-timezone-names.swift > Sources/TimeTravel/Public/TimeZone+Name.swift
  ```
  `TimeZoneTests.enumMatchesHostTimeZoneIdentifiers` will fail when the enum has drifted from the host's tzdata.
- **`Date.explodingWhaleDay`** is the canonical fixed reference date used across tests. Reuse it rather than introducing new ad-hoc dates so expected offsets stay verifiable by hand.

## Testing conventions

- Uses **Swift Testing** (`import Testing`, `@Test`, `#expect`, `#require`), not XCTest.
- Most tests are **parameterized** via `@Test(arguments: [...])` over tuples of `(TimeZone.Name, expectedDelta)`. Follow that pattern when adding cases — add a row, don't write a new function.
- Tests use `@testable import TimeTravel` so internal helpers (`Int.hours`) are available for assertions.
