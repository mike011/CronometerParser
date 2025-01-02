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
    printFullDate(timestamp)
    printMonth(timestamp)
    printDayOfWeek(timestamp)
}

fileprivate func printFullDate(_ timestamp: Date) {
    let formatter = DateFormatter()
    formatter.setLocalizedDateFormatFromTemplate("MMMdd")
    print(formatter.string(from: timestamp), terminator: "\t")
}

fileprivate func printMonth(_ timestamp: Date) {
    let formatter = DateFormatter()
    formatter.setLocalizedDateFormatFromTemplate("MM")
    print(formatter.string(from: timestamp), terminator: "\t")
}

fileprivate func printDayOfWeek(_ timestamp: Date) {
    let formatter = DateFormatter()
    formatter.setLocalizedDateFormatFromTemplate("EEEE")
    print(formatter.string(from: timestamp), terminator: "\t")
}

func printCalorieComparisonSimple(records: [Date:Summary]) {
    print("--------------------------------------------------")
    for key in records.keys.sorted() {
        print(date(key), terminator: "\t")
        var consumed: Float = 0
        if let intake = records[key]?.intake {
            consumed = intake.energy ?? 0
            print(String(format: "%0.1f", arguments: [consumed]), separator: "", terminator: "\t")
        }

        var burned: Float = -1679.0
        if let exercises = records[key]?.exercises {
            for exercise in exercises {
                burned += exercise.calories
            }
        }
        print(String(format: "%0.1f", arguments: [burned]), separator: "", terminator: "\t")

        let diff = burned / consumed
        print(String(format: "%0.1f", arguments: [diff]), separator: "", terminator: "\n")
        print("--------------------------------------------------")
    }
}

func printCalorieComparison(records: [Date:Summary]) {
    print("Date\tM\tW\tBurned\tCons\tdiff\tPro %\tCarb %\tFats %\t%Raw")
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

        let consumed = intake.energy ?? 0
        print(String(format: "%0.1f", arguments: [consumed]), separator: "", terminator: "\t")

        let diff = ((consumed - (abs(burned))) / (abs(burned))) * 100.0
        let percent = String(format: "%0.1f", arguments: [diff])
        print("\(percent)%", separator: "", terminator: "\t")

        let protein = intake.protein ?? 0 * 4
        let carbs = intake.netCarbs ?? 0 * 4
        let fat = intake.fat ?? 0 * 9
        let total = protein + carbs + fat

        printPercentage(for: protein, total)
        printPercentage(for: carbs, total)
        printPercentage(for: fat, total)
        print()
    }
}

fileprivate func printPercentage(for top: Float, _ total: Float) {
    var percentage: Float = 0.0
    if total > 0 {
        percentage = (top / total) * 100
    }

    print(String(format: "%0.1f", arguments: [percentage])+"%", separator: "", terminator: "\t")
}
