import SwiftUI

struct DailyScrum: Identifiable {
    let id = UUID()
    var title: String
    var attendees: [Attendee]
    var lengthInMinutes: Int
    var theme: Theme
}

struct Attendee: Identifiable {
    let id = UUID()
    var name: String
}

extension [String] {
    var attendess: [Attendee] {
        return map { Attendee(name: $0) }
    }
}

extension DailyScrum {
    static let sampleData: [DailyScrum] = [
        DailyScrum(
            title: "Design",
            attendees: ["Cathy", "Daisy", "Simon", "Jonathan"].attendess,
            lengthInMinutes: 10,
            theme: .yellow
        ),
        DailyScrum(
            title: "App Dev",
            attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"].attendess,
            lengthInMinutes: 5,
            theme: .sky
        ),
        DailyScrum(
            title: "Web Dev",
            attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"].attendess,
            lengthInMinutes: 5,
            theme: .buttercup
        ),
    ]
}
