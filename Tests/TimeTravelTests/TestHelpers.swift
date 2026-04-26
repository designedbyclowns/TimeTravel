import Foundation

extension TimeInterval {
    var minutes: TimeInterval { self * 60 }
    var hours: TimeInterval { self * 60 * 60 }
}

extension Int {
    var minutes: TimeInterval { TimeInterval(self).minutes }
    var hours: TimeInterval { TimeInterval(self).hours }
}
