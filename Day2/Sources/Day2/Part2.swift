public struct Part2 {
    public static func calculate(from input: String) -> Int {
        return input
            .split(separator: /\n/)
            .reduce(into: 0) { partialResult, line in
                let productOfGames = GameOutcome(String(line)).outcomes.map(\.amount).reduce(1, *)
                partialResult += productOfGames
            }
    }
}
