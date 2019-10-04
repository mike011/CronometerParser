import Foundation

var summary = parseDailyIntake(fileName: "/Users/michael/Downloads/dailySummary.csv")
//printDailyIntake(records: Array(summary.values))

parseDailyExercise(fileName: "/Users/michael/Downloads/exercises.csv", summary: &summary)
//printDailyExercise(records: Array(summary.values))

printCalorieComparison(records: summary)
