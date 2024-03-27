import SwiftUI

struct DailyScrum: Identifiable, Codable {
    let id: UUID
    var title: String
    var attendees: [Attendee]
    var lengthInMinutes: Int
    var theme: Theme
    var history: [History]
    
    init(title: String = "", attendees: [String] = [], lengthInMinutes: Int = 5, theme: Theme = .yellow, history: [History] = []) {
        self.id = UUID()
        self.title = title
        self.attendees = attendees.map { Attendee(name: $0) }
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
        self.history = history
    }
}

extension DailyScrum {
    struct History: Identifiable, Codable {
        var id: UUID = UUID()
        var date: Date = .now
        var attendees: [Attendee] = []
    }
}



extension DailyScrum {
    var lengthInMinutesAsDouble: Double {
        get { Double(lengthInMinutes) }
        set { lengthInMinutes = Int(newValue) }
    }
}

extension DailyScrum {
    struct Attendee: Identifiable, Codable {
        var id: UUID = UUID()
        var name: String
    }
}

extension DailyScrum {
    static let sampleData = [
        DailyScrum(
            title: "Design",
            attendees: ["Cathy", "Daisy", "Simon", "Jonathan"],
            lengthInMinutes: 10,
            theme: .yellow,
            history: [History(attendees: [Attendee(name: "Cathy")]) ]
        ),
        DailyScrum(
            title: "App Dev",
            attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"],
            lengthInMinutes: 5,
            theme: .magenta
        ),
        DailyScrum(
            title: "Web Dev",
            attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"],
            lengthInMinutes: 5,
            theme: .poppy
        )
    ]
}
