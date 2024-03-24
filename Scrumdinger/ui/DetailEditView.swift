import SwiftUI

struct DetailEditView: View {
    @Binding var scrum: DailyScrum
    @State private var attendeeName: String = ""
    
    @Environment(\.dismiss) var dismiss: DismissAction
    var onDone: () -> Void
    
    var body: some View {
        Form {
            Section("Meeting Info") {
                TextField("Title", text: $scrum.title)
                
                HStack {
                    Slider(value: $scrum.lengthInMinutesAsDouble, in: 5...30, step: 1)
                        .accessibilityLabel("\(scrum.lengthInMinutes) minutes")
                    Text("\(Int(scrum.lengthInMinutes)) minutes")
                        .accessibilityHidden(true)
                }
            }
            
            Section("Attendees") {
                ForEach(scrum.attendees) {attendee in
                    Text(attendee.name)
                }.onDelete(perform: { indexSet in
                    scrum.attendees.remove(atOffsets: indexSet)
                })
                
                let formattedAttendeeName = attendeeName.trimmingCharacters(in: .whitespacesAndNewlines)
                
                HStack {
                    TextField("New Attendee", text: $attendeeName)
                    Button(action: {
                        withAnimation {
                            scrum.attendees.append(DailyScrum.Attendee(name: formattedAttendeeName))
                            attendeeName = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add attendee")
                    }
                    .disabled(formattedAttendeeName.isEmpty)
                }
            }
        }
        .navigationTitle("New scrum")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") { dismiss() }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button("Done", action: onDone)
                .font(.headline)
                .disabled(scrum.title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            }
        }
    }
}

#Preview {
    @State var scrum = DailyScrum()

    return NavigationView {
        DetailEditView(scrum: $scrum) {}
    }
}
