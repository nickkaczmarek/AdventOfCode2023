//
//  main.swift
//
//
//  Created by Nick Kaczmarek on 12/8/23.
//

import Foundation
import Day1

do {
    guard let filePath = Bundle.module.path(forResource: "Day1", ofType: "txt") else { fatalError("text file is missing")}
    let input: String = try String(contentsOfFile: filePath)

//    print(try Part1.calibrate(input))
    print(try Part2.calibrate(input))
} catch {
    print(error)
}

