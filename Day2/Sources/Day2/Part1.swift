public struct Part1 {
    public static func calculate(from input: String) -> Int {
        return input
            .split(separator: /\n/)
            .reduce(into: 0) { partialResult, line in
                let potentialGames = GameOutcome(String(line))

                if GameOutcome.possibleGames.outcomes.elementsLessThanOrEqual(potentialGames.outcomes) {
                    partialResult += potentialGames.gameNumber!
                }
            }
    }
}
