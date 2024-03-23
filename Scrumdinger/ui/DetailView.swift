import SwiftUI

struct DetailView: View {
    var scrum: DailyScrum
    
    var body: some View {
        VStack {
            List {
                Section("Info") {
                    NavigationLink(destination: MeetingView()) {
                        Label("Start meeting", systemImage: "timer")
                            .font(.headline)
                            .foregroundColor(.accentColor)
                    }
                    
                    HStack {
                        Label("Length", systemImage: "clock")
                        Spacer()
                        Text("\(scrum.lengthInMinutes) minutes")
                    }
                    .accessibilityElement(children: .combine)
                    
                    HStack {
                        Label("Theme", systemImage: "paintpalette")
                        Spacer()
                        Text(scrum.theme.name)
                            .padding(4)
                            .background(scrum.theme.mainColor)
                            .foregroundColor(scrum.theme.accentColor)
                            .cornerRadius(4)
                    }
                    .accessibilityElement(children: .combine)
                }

                Section("Attendess") {
                    ForEach(scrum.attendees) {attendee in
                        Text(attendee.name)
                    }
                }
            }
        }.navigationTitle(scrum.title)
    }
}

#Preview {
    NavigationView {
        DetailView(scrum: DailyScrum.sampleData.first!)
    }
}
