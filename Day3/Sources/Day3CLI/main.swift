// The Swift Programming Language
// https://docs.swift.org/swift-book

import Day3
import Foundation

do {
    guard let filePath = Bundle.module.path(forResource: "Day3", ofType: "txt") else { fatalError("text file is missing")}
    let input: String = try String(contentsOfFile: filePath)

    print("Part 1:", Part1().calculate(input))
    print("Part 2:", Part2().calculate(input))
} catch {
    print(error)
}
