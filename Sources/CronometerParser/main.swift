import Foundation
import CSV

let stream = InputStream(fileAtPath: "/Users/michael/Downloads/dailySummary.csv")!
let csv = try! CSVReader(stream: stream)
while let row = csv.next() {
    print("\(row)")
}

print("Hello, world!")
