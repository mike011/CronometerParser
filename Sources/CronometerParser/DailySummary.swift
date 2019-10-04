//
//  DailySummary.swift
//  CSV
//
//  Created by Michael Charland on 2019-10-03.
//

import Foundation

func printDailySummary(records: [Date:Summary]) {
    for key in records.keys {
        print(key)
        print("--------------------------------------------------")
        if let intake = records[key]?.intake { print(intake) }
        if let exercises = records[key]?.exercises { print(exercises) }
        print("--------------------------------------------------")
    }
}

func printCalorieComparison(records: [Date:Summary]) {
    for key in records.keys {
        print(key)
        print("--------------------------------------------------")
        var consumed: Float = 0
        if let intake = records[key]?.intake {
            consumed = intake.energy
            print(String(format: "%0.1f", arguments: [consumed]), separator: "", terminator: "\t")
        }

        var burned: Float = -1679.0
        if let exercises = records[key]?.exercises {
            for exercise in exercises {
                burned += exercise.calories
            }
        }
        print(String(format: "%0.1f", arguments: [burned]), separator: "", terminator: "\t")

        let diff = consumed + burned
        print(String(format: "%0.1f", arguments: [diff]), separator: "", terminator: "\n")
        print("--------------------------------------------------")
    }
}
