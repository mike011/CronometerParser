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

func date(_ timestamp: Date?) -> String {
    guard let timestamp = timestamp as Date? else { return "" }
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    return formatter.string(from: timestamp)
}

func printDateInfo(_ timestamp: Date?) {
    guard let timestamp = timestamp as Date? else { return }
    let formatter = DateFormatter()
    formatter.setLocalizedDateFormatFromTemplate("MMMdd")
    print(formatter.string(from: timestamp), terminator: "\t") // full date
    formatter.setLocalizedDateFormatFromTemplate("MM")
    print(formatter.string(from: timestamp), terminator: "\t") // month
    formatter.setLocalizedDateFormatFromTemplate("ww")
    print(formatter.string(from: timestamp), terminator: "\t") // week
    formatter.setLocalizedDateFormatFromTemplate("dd")
    print(formatter.string(from: timestamp), terminator: "\t") // day of month
}

func printCalorieComparisonSimple(records: [Date:Summary]) {
    print("--------------------------------------------------")
    for key in records.keys.sorted() {
        print(date(key), terminator: "\t")
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

        let diff = consumed / abs(burned) - 1
        print(String(format: "%0.1f", arguments: [diff]), separator: "", terminator: "\n")
        print("--------------------------------------------------")
    }
}

func printCalorieComparison(records: [Date:Summary]) {
    print("Date\tM\tW\tD\tBurned\tCons\tdiff\tPro %\tCarb %\tFats %\t%Raw")
    for key in records.keys.sorted() {
        printDateInfo(key)
        guard let intake = records[key]?.intake else {
            return
        }

        var burned: Float = -1679.0
        if let exercises = records[key]?.exercises {
            for exercise in exercises {
                burned += exercise.calories
            }
        }
        print(String(format: "%0.1f", arguments: [abs(burned)]), separator: "", terminator: "\t")

        let consumed = intake.energy
        print(String(format: "%0.1f", arguments: [consumed]), separator: "", terminator: "\t")

        let diff = (consumed / abs(burned) - 1) * 100
        let percent = String(format: "%0.1f", arguments: [diff])
        print("\(percent)%", separator: "", terminator: "\t")

        let protein = intake.protein * 4
        let carbs = intake.netCarbs * 4
        let fat = intake.fat * 9
        let total = protein + carbs + fat

        let proteinp = (protein / total) * 100
        print(String(format: "%0.1f", arguments: [proteinp])+"%", separator: "", terminator: "\t")

        let carbsp = (carbs / total) * 100
        print(String(format: "%0.1f", arguments: [carbsp])+"%", separator: "", terminator: "\t")

        let fatp = (fat / total) * 100
        print(String(format: "%0.1f", arguments: [fatp])+"%", separator: "", terminator: "\t")

        print()
    }
}
