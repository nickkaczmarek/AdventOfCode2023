import Foundation

let input = """
467..114..
...*......
..35..633.
......#...
617*......
.....+.58.
..592.....
......755.
...$.*....
.664.598..
"""

let lines = input.split(separator: /\n/)

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
        line.distance(from: line.startIndex, to: range.upperBound)
    }

    var description: String {
        "\(symbol)"
    }

    func isAdjacentTo(location: Location) -> Bool {
        return if lineNumber - 1 == location.lineNumber {
            // if symbol is ± 1 from part start or end index
            startIndex - 1 == location.startIndex || startIndex + 1 == location.endIndex
        } else if lineNumber + 1 == location.lineNumber {
            startIndex - 1 == location.startIndex || startIndex + 1 == location.endIndex
        } else {
            false
        }
    }
}

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

for partNumberLocation in partNumberLocations {
    let adjacentSymbols = symbolLocations.filter {
        $0.isAdjacentTo(location: partNumberLocation)
    }
    print(adjacentSymbols)
}
