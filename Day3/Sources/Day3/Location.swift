import Foundation

struct Location: CustomStringConvertible {
    var lineNumber: Int
    var range: Range<String.Index>
    var line: Substring

    var symbol: Substring {
        line[range]
    }

    var startIndex: Int {
        line.distance(from: line.startIndex, to: range.lowerBound)
    }

    var endIndex: Int {
        line.distance(from: line.startIndex, to: range.upperBound) - 1
    }

    var description: String {
        "\(symbol)"
    }
}

extension Location {
    func isOnAdjacentLineToOne(location: Location) -> Bool {
        return if self.lineNumber == location.lineNumber || self.lineNumber - 1 == location.lineNumber || self.lineNumber + 1 == location.lineNumber {
            true
        } else {
            false
        }
    }

    func isNearbyPositionTo(_ other: Location) -> Bool {
        return if self.startIndex == other.startIndex || self.startIndex == other.endIndex {
            true
        } else if self.startIndex - 1 == other.startIndex || self.startIndex - 1 == other.endIndex {
            true
        } else if self.startIndex + 1 == other.startIndex || self.startIndex + 1 == other.endIndex {
            true
        } else {
            false
        }

    }
}

extension Location: Hashable {
    static func == (lhs: Location, rhs: Location) -> Bool {
        return lhs.lineNumber == rhs.lineNumber && lhs.range == rhs.range && lhs.line == rhs.line
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(lineNumber)
        hasher.combine(range)
        hasher.combine(line)
    }
}
