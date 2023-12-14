import Foundation

public struct Part2 {
    static let encodedNumbers: [String: Int] = [
        "one": 1,
        "two": 2,
        "three": 3,
        "four": 4,
        "five": 5,
        "six": 6,
        "seven": 7,
        "eight": 8,
        "nine": 9,
    ]

    private static var sortedEncodedNumberKeys: [String] {
        encodedNumbers.sorted { $0.1 < $1.1 }.map(\.key)
    }

    public static func calibrate(_ input: String) throws -> Int {
        return input
        // lowercase string
            .lowercased()
        // split newlines into an array
            .split(separator: /\n/)
            .map { parseLastNumberWord(from: String($0)) }
            .map { parseFirstNumberWord(from: String($0)) }
            .map { $0.replacing(/[a-z]/, with: "") }
        // get first and last character and coerce into a string
            .map { Int("\($0.first!)\($0.last!)")! }
        // sum ints
            .reduce(0, +)
    }

    private static func parseLastNumberWord(from input: String) -> String {
        // don't parse a last number if the last character is already a number
        guard !input.isLastCharacterANumber() else { return input }
        let digitsInInput = input.matches(of: /\d/)
        var indexOfLastNumber = 0
        if let lastDigitInInput = digitsInInput.last {
            indexOfLastNumber = input.distance(from: input.startIndex, to: lastDigitInInput.range.lowerBound)
        }
        let defaultResult = (index: Int.min, range: "".startIndex..<"".endIndex, word: "")
        let lastResult = sortedEncodedNumberKeys.reduce(into: defaultResult) { lastIndex, numberWord in
            // find range of numbered word in string starting at the end of the string
            if let range = input.range(of: numberWord, options: .backwards) {
                let index = input.distance(from: input.startIndex, to: range.lowerBound)
                guard index > indexOfLastNumber else { return }
                if index > lastIndex.index {
                    lastIndex = (index, range, String(encodedNumbers[numberWord]!))
                }
            }
            lastIndex = lastIndex
        }

        if lastResult.index != Int.min {
            return input.replacingCharacters(in: lastResult.range, with: lastResult.word)
        }

        return input
    }

    private static func parseFirstNumberWord(from input: String) -> String {
        guard !input.isFirstCharacterANumber() else { return input }
        let defaultResult = (index: Int.max, range: "".startIndex..<"".endIndex, word: "")
        let firstResult = sortedEncodedNumberKeys.reduce(into: defaultResult) { partialResult, numberWord in
            if let range = input.firstRange(of: numberWord) {
                let index = input.distance(from: input.startIndex, to: range.lowerBound)
                if index < partialResult.index {
                    partialResult = (index, range, String(encodedNumbers[numberWord]!))
                }
            }
        }

        if firstResult.index != Int.max {
            return input.replacingCharacters(in: firstResult.range, with: firstResult.word)
        }

        return input
    }
}

extension String {
    func isLastCharacterANumber() -> Bool {
        self.firstMatch(of: /\d$/) != nil
    }

    func isFirstCharacterANumber() -> Bool {
        self.firstMatch(of: /^\d/) != nil
    }
}
