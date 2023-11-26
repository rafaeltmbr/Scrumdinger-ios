import SwiftUI

struct DetailEditView: View {
    @State private var scrum = DailyScrum.emptyScrum
    @State private var newAttendeeName = ""

    var body: some View {
        Form {
            Section(header: Text("Meeting Info")) {
                TextField("Title", text: $scrum.title)
                HStack {
                    Slider(value: $scrum.lengthInMinutesAsDouble, in: 5...30, step: 1) {
                        Text("Length")
                    }
                    .accessibilityValue("\(scrum.lengthInMinutes) minutes")
            
                    Text("\(scrum.lengthInMinutes) minutes")
                        .accessibilityHidden(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                }
            }
            
            Section(header: Text("Attendees")) {
                HStack {
                    TextField("New attendee", text: $newAttendeeName)
                    Button(action: {
                        withAnimation {
                            scrum.attendees.append(Attendee(name: newAttendeeName))
                            newAttendeeName = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add attendee")
                    }
                    .disabled(newAttendeeName.isEmpty)
                }
                
                ForEach(scrum.attendees) {attendee in
                    Text(attendee.name)
                }
                .onDelete {indices in
                    scrum.attendees.remove(atOffsets: indices)
                }
            }
        }
    }
}

#Preview {
    DetailEditView()
}
