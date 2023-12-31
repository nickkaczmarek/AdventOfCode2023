import Foundation

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
                if $0.isOnAdjacentLineToOne(location: partNumberLocation), $0.isNearbyPositionTo(partNumberLocation) {
                    partNumbers.append(Int(partNumberLocation.description)!)
                }
            }
        }

        return partNumbers.reduce(0, +)
    }
}
