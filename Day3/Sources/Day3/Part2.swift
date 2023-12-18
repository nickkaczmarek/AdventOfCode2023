import Foundation

public struct Part2 {
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

            let starMatches = line.matches(of: /\*/)
            starMatches.forEach { match in
                let location = Location(lineNumber: lineNumber, range: match.range, line: line)
                symbolLocations.append(location)
            }
        }

        var symbolsMap: [Location: [Int]] = [:]

        for partNumberLocation in partNumberLocations {
            symbolLocations.forEach {
                if $0.isOnAdjacentLineToOne(location: partNumberLocation), $0.isNearbyPositionTo(partNumberLocation) {
                    if symbolsMap[$0] == nil {
                        symbolsMap[$0] = [Int(partNumberLocation.description)!]
                    } else {
                        symbolsMap[$0]!.append(Int(partNumberLocation.description)!)
                    }
                }
            }
        }

        let symbolsMapWithOnlyTwoAdjacents = symbolsMap.filter { $0.value.count == 2 }

        var result = 0
        for symbol in symbolsMapWithOnlyTwoAdjacents {
            result += symbol.value.reduce(1, *)
        }

        return result
    }
}

