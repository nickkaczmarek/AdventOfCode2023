import Foundation

enum Colors: String, RawRepresentable, CustomStringConvertible, CaseIterable {
    case red, green, blue

    var description: String {
        self.rawValue
    }
}

struct Outcome: Equatable, Comparable, CustomStringConvertible {
    static func < (lhs: Outcome, rhs: Outcome) -> Bool {
        lhs.color == rhs.color &&
        lhs.amount < rhs.amount
    }

    var color: Colors
    var amount: Int

    init(_ outcome: (key: Colors, value: Int)) {
        self.color = outcome.key
        self.amount = outcome.value
    }

    var description: String {
        "\(color.rawValue): \(amount)"
    }
}

struct GameOutcome: Equatable, CustomStringConvertible {
    var outcomes: [Outcome]

    init(_ outcomes: [Colors: Int]) {
        self.outcomes = outcomes.map(Outcome.init)
    }

    var description: String {
        outcomes.map(\.description).joined(separator: ", ")
    }
}

extension Array where Element == Outcome {
    func elementsLessThanOrEqual(_ other :[Outcome]) -> Bool {
        allSatisfy { possible in
            let potential = other.first { $0.color == possible.color }
            return potential! <= possible
        }
    }
}

public struct Part1 {
    static let possibleGames: GameOutcome = .init([
        .red: 12,
        .green: 13,
        .blue: 14
    ])

    public static func calculate(from input: String) -> Int {
        return input
            .split(separator: /\n/)
            .reduce(into: 0) { partialResult, line in
                let gameSplit = line.split(separator: ":")
                guard let gameNum = Int(gameSplit[0].firstMatch(of: /\d+/)!.output) else { return }
                let games = gameSplit[1]
                    .split(separator: ";")
                    .flatMap { $0
                        .split(separator: ",")
                        .map { $0.trimmingCharacters(in: .whitespaces) }
                    }

                let output: [Colors:Int] = [
                    .blue: 0,
                    .green: 0,
                    .red: 0
                ]

                let potentialGames = GameOutcome(games.reduce(into: output) { partialResult, game in
                    let splitGame = game.split(separator: /\s/)
                    let count: Int = Int(splitGame[0])!
                    let color = Colors(rawValue: String(splitGame[1]))!
                    let oldCount = partialResult[color]!
                    if count > oldCount {
                        partialResult[color] = count
                    }
                })

                if possibleGames.outcomes.elementsLessThanOrEqual(potentialGames.outcomes) {
                    partialResult += gameNum
                }
            }
    }
}
