import Foundation

extension Int {
    var seconds: TimeInterval { TimeInterval(self).seconds }
    var minutes: TimeInterval { TimeInterval(self).minutes }
    var hours: TimeInterval { TimeInterval(self).hours }
}
