import Foundation
import CSV

var records = [DailySummary]()
do {
    let stream = InputStream(fileAtPath: "/Users/michael/Downloads/dailySummary.csv")!
    let reader = try! CSVReader(stream: stream, hasHeaderRow: true)

    let decoder = CSVRowDecoder()
    while reader.next() != nil {
        let row = try decoder.decode(DailySummary.self, from: reader)
        records.append(row)
    }
} catch {
    // Invalid row format
}

print("Date\t\tEnergy\tProtein\tCarbs\tFats\tProtein\tCarbs\tFats\tP%\tC%\tF%")
for record in records {
    let carbsCals = record.carbs*4
    let fatCals = record.fat*9
    let proteinCals = record.protein*4
    let cals = carbsCals+fatCals+proteinCals

    print(record.date, separator: "", terminator: "\t")
    print(String(format: "%0.0f", arguments: [cals]), separator: "", terminator: "\t")
    print(String(format: "%0.1f", arguments: [record.protein]), separator: "", terminator: "\t")
    print(String(format: "%0.1f", arguments: [record.carbs]), separator: "", terminator: "\t")
    print(String(format: "%0.1f", arguments: [record.fat]), separator: "", terminator: "\t")

    print(String(format: "%0.1f", arguments: [proteinCals]), separator: "", terminator: "\t")
    print(String(format: "%0.1f", arguments: [carbsCals]), separator: "", terminator: "\t")
    print(String(format: "%0.1f", arguments: [fatCals]), separator: "", terminator: "\t")

    print("\(String(format: "%2.0f", arguments: [proteinCals/cals*100]))%", separator: "", terminator: "\t")
    print("\(String(format: "%2.0f", arguments: [carbsCals/cals*100]))%", separator: "", terminator: "\t")
    print("\(String(format: "%2.0f", arguments: [fatCals/cals*100]))%", separator: "", terminator: "\n")
}
