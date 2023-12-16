import Foundation
import Day2


do {
    guard let filePath = Bundle.module.path(forResource: "Day2", ofType: "txt") else { fatalError("text file is missing")}
    let input: String = try String(contentsOfFile: filePath)

    print(Part1.calculate(from: input))
    print(Part2.calculate(from: input))
} catch {
    print(error)
}
