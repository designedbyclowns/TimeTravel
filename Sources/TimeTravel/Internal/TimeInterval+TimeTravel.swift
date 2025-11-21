import Foundation

extension TimeInterval {
    var seconds: TimeInterval { self }
    var minutes: TimeInterval { self * 60.0 }
    var hours: TimeInterval { self * 60.0 * 60.0 }
}
