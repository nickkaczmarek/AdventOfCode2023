//
//  Day1Tests.swift
//  
//
//  Created by Nick Kaczmarek on 12/8/23.
//

import XCTest
@testable import Day1

final class Day1Tests: XCTestCase {

    func test_VariousTestCases() throws {
        XCTAssertEqual(41, try XCTUnwrap(Part2.calibrate("trknlxnv43zxlrqjtwonect")))
        XCTAssertEqual(85, try XCTUnwrap(Part2.calibrate("heightseven4two5")))
        XCTAssertEqual(14, try XCTUnwrap(Part2.calibrate("zoneight234")))
        XCTAssertEqual(16, try XCTUnwrap(Part2.calibrate("dtoneight5gxqbzbbvxc6gpplfzgmkbvmdnlhmg")))

        let longerInput = """
two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen
"""
        let expected = 281
        let actual = try XCTUnwrap(Part2.calibrate(longerInput))

        XCTAssertEqual(actual, expected)
    }
}
