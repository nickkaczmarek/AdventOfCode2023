import Foundation

enum Colors: String, RawRepresentable, CustomStringConvertible, CaseIterable {
    case red, green, blue

    var description: String {
        self.rawValue
    }
}

//struct Outcome: Equatable, Comparable {
//    static func < (lhs: Outcome, rhs: Outcome) -> Bool {
//        lhs.color == rhs.color &&
//        lhs.amount < rhs.amount
//    }
//
//    var color: Colors
//    var amount: Int
//
//    init(_ outcome: (key: Colors, value: Int)) {
//        self.color = outcome.key
//        self.amount = outcome.value
//    }
//}
//
//struct GameOutcome: Equatable {
//    var outcomes: [Outcome]
//
//    init(_ outcomes: [Colors: Int]) {
//        self.outcomes = outcomes.map(Outcome.init)
//    }
//}
//
//extension Array where Element == Outcome {
//    func elementsLessThanOrEqual(_ other :[Outcome]) -> Bool {
//        allSatisfy { possible in
//            let potential = other.first { $0.color == possible.color }
//            return potential! <= possible
//        }
//    }
//}
//
//let possibleGames: GameOutcome = .init([
//    .red: 12,
//    .green: 13,
//    .blue: 14
//])
//
//let potentialGames: GameOutcome = .init([
//    .red: 11,
//    .green: 13,
//    .blue: 14
//])
//
//let result = possibleGames.outcomes.allSatisfy { possible in
//    let potential = potentialGames.outcomes.first { $0.color == possible.color }
//    return potential! <= possible
//}
//
//print(result)
//
//let r2 = possibleGames.outcomes.elementsLessThanOrEqual(potentialGames.outcomes)
//print(r2)

