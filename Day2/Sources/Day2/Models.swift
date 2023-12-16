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
    var gameNumber: Int?

    static let possibleGames: GameOutcome = .init([
        .red: 12,
        .green: 13,
        .blue: 14
    ])

    private init(_ outcomes: [Colors: Int], _ gameNumber: Int? = 0) {
        self.outcomes = outcomes.map(Outcome.init)
        self.gameNumber = gameNumber
    }

    init(_ line: String) {
        let gameSplit = line.split(separator: ":")
        let gameNum = Int(gameSplit[0].firstMatch(of: /\d+/)!.output)!
        let games = String(gameSplit[1])
            .split(separator: ";")
            .flatMap { $0
                .split(separator: ",")
                .map { String($0) }
            }

        let output: [Colors:Int] = [
            .blue: 0,
            .green: 0,
            .red: 0
        ]

        let potentialGames = games.reduce(into: output) { partialResult, game in
            let splitGame = game.split(separator: /\s/)
            let count: Int = Int(splitGame[0])!
            let color = Colors(rawValue: String(splitGame[1]))!
            let oldCount = partialResult[color]!
            if count > oldCount {
                partialResult[color] = count
            }
        }

        self.init(potentialGames, gameNum)
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
