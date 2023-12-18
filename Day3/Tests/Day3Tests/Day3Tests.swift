import XCTest
import Day3

final class Day3Tests: XCTestCase {
    func test_part1() throws {
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
        let expected = 4361
        let actual = Part1().calculate(input)

        XCTAssertEqual(actual, expected)
    }

    /// The missing part wasn't the only issue - one of the gears in the engine is wrong.
    /// A gear is any * symbol that is adjacent to exactly two part numbers.
    /// Its gear ratio is the result of multiplying those two numbers together.
    /// In this schematic, there are two gears.
    /// The first is in the top left; it has part numbers 467 and 35, so its gear ratio is 16345.
    /// The second gear is in the lower right; its gear ratio is 451490.
    /// (The * adjacent to 617 is not a gear because it is only adjacent to one part number.)
    /// Adding up all of the gear ratios produces 467835.
    /// This time, you need to find the gear ratio of every gear and add them all up so that the engineer can figure out which gear needs to be replaced.
    func test_part2() throws {
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

        let expected = 467835
        let actual = Part2().calculate(input)

        XCTAssertEqual(actual, expected)
    }
}
