import Foundation

struct DailyScrumHistory {
    let id: UUID = UUID()
    var scrum: DailyScrum
    var startedAt: Date
}
