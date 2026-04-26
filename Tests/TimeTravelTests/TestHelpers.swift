import Foundation
import Testing

extension TimeInterval {
    var minutes: TimeInterval { self * 60 }
    var hours: TimeInterval { self * 60 * 60 }
}

extension Int {
    var minutes: TimeInterval { TimeInterval(self).minutes }
    var hours: TimeInterval { TimeInterval(self).hours }
}

func expectEqual(
    _ a: TimeInterval,
    _ b: TimeInterval,
    tolerance: TimeInterval = 0.001,
    sourceLocation: SourceLocation = #_sourceLocation
) {
    #expect(
        abs(a - b) <= tolerance,
        "Expected \(a) ≈ \(b) within \(tolerance)",
        sourceLocation: sourceLocation
    )
}
