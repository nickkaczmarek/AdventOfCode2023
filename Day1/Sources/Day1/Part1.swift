//
//  File.swift
//  
//
//  Created by Nick Kaczmarek on 12/8/23.
//

import Foundation

public struct Part1 {
    public static func calibrate(_ input: String) throws -> Int {
        return input
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
