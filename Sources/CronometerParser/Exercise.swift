//
//  Exercise.swift
//  CSV
//
//  Created by Michael Charland on 2019-10-02.
//

import CSV
import Foundation

struct Exercise: Decodable {
    let date: Date
    let exercise: String
    let minutes: Float
    let calories: Float

    enum CodingKeys : String, CodingKey {
        case date = "Day"
        case exercise = "Exercise"
        case minutes = "Minutes"
        case calories = "Calories Burned"
    }
}

func parseDailyExercise(fileName: String, summary: inout [Date:Summary]) {
    do {
        let stream = InputStream(fileAtPath: fileName)!
        let reader = try! CSVReader(stream: stream, hasHeaderRow: true)

        let decoder = CSVRowDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
        while reader.next() != nil {
            let row = try decoder.decode(Exercise.self, from: reader)
            if summary[row.date] == nil {
                summary[row.date] = Summary(intake: nil)
            }
            summary[row.date]!.exercises.append(row)
        }
    } catch {
        // Invalid row format
    }
}

func printDailyExercise(records: [Summary]) {

    print("Date\t\tExercise\tMinutes\tCals")
    for record in records {
        for exercise in record.exercises {
            print(exercise.date, separator: "", terminator: "\t")
            print(exercise.exercise, separator: "", terminator: "\t")
            print(String(format: "%0.1f", arguments: [exercise.minutes]), separator: "", terminator: "\t")
            print(String(format: "%0.1f", arguments: [exercise.calories]), separator: "", terminator: "\n")
        }
    }
}
