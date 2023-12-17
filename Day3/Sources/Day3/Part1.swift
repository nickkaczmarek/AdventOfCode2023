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

    func isAdjacentTo(location: Location) -> Bool {
        return if self.lineNumber == location.lineNumber || self.lineNumber - 1 == location.lineNumber || self.lineNumber + 1 == location.lineNumber {
            self.isNearby(location)
        } else {
            false
        }
    }
}

extension Location {
    func isNearby(_ other: Location) -> Bool {
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


public struct Part1 {
    public init() {}


    public func calculate(_ input: String) -> Int {
        let lines = input.split(separator: /\n/)

        var symbolLocations = [Location]()
        var partNumberLocations = [Location]()

        for line in lines {
            let lineNumber = lines.firstIndex(of: line)!
            let matches = line.matches(of: /\d+/)
            matches.forEach { match in
                let location = Location(lineNumber: lineNumber, range: match.range, line: line)
                partNumberLocations.append(location)
            }

            let starMatches = line.matches(of: /[^\^\d.]/)
            starMatches.forEach { match in
                let location = Location(lineNumber: lineNumber, range: match.range, line: line)
                symbolLocations.append(location)
            }
        }

        var partNumbers = [Int]()
        for partNumberLocation in partNumberLocations {
            symbolLocations.forEach {
                if $0.isAdjacentTo(location: partNumberLocation) {
                    partNumbers.append(Int(partNumberLocation.description)!)
                }
            }
        }

        return partNumbers.reduce(0, +)
    }

}

