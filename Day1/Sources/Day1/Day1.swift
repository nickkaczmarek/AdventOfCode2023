import Foundation

@available(macOS 13.0, *)
@main
struct Day1 {
    static func main() {
        do {
            print(try calibrate())
        } catch {
            print(error)
        }
    }

    static func calibrate() throws -> Int {
        guard let filePath = Bundle.module.path(forResource: "Day1", ofType: "txt") else { fatalError("text file is missing")}
        var fileContents: String = try String(contentsOfFile: filePath)

        return fileContents
            // lowercase string
            .lowercased()
            // replace all letters with nothing
            .replacing(/[a-z]/, with: "")
            // split newlines into an array
            .split(separator: /\n/)
            // get first and last character and coerce into a string
            .map { Int("\($0.first!)\($0.last!)")! }
            // sum ints
            .reduce(0, +)
    }
}

