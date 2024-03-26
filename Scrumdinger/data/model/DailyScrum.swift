import SwiftUI

struct DailyScrum: Identifiable {
    let id: UUID
    var title: String
    var attendees: [Attendee]
    var lengthInMinutes: Int
    var theme: Theme
    
    init(title: String = "", attendees: [String] = [], lengthInMinutes: Int = 5, theme: Theme = .yellow) {
        self.id = UUID()
        self.title = title
        self.attendees = attendees.map { Attendee(name: $0) }
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
}



extension DailyScrum {
    var lengthInMinutesAsDouble: Double {
        get { Double(lengthInMinutes) }
        set { lengthInMinutes = Int(newValue) }
    }
}

extension DailyScrum {
    struct Attendee: Identifiable {
        let id: UUID = UUID()
        var name: String
    }
}

extension DailyScrum {
    static let sampleData = [
        DailyScrum(
            title: "Design",
            attendees: ["Cathy", "Daisy", "Simon", "Jonathan"],
            lengthInMinutes: 1,
            theme: .yellow
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
