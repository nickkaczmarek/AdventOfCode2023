import XCTest
import Day4

final class Day4Tests: XCTestCase {
    func test_part1() throws {
        let input = """
Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11
"""
        let expected = 13
        let actual = Part1().calculate(input)

        XCTAssertEqual(actual, expected)
    }

    func test_part1_2() throws {
        let input = "Card 220: 34 88 44 16 90  6 58 94 64 73 |  5 70 76 53 15 68 28  4 32 65 92 91 24 86 85 31 36 67 83 18 95 45  8 51 74"
        let expected = 0
        let actual = Part1().calculate(input)

        XCTAssertEqual(actual, expected)
    }



    func test_part2() throws {
        let input = """
"""

        let expected = 0
        let actual = 0

        XCTAssertEqual(actual, expected)
    }
}
