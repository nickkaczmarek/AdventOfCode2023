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
}
