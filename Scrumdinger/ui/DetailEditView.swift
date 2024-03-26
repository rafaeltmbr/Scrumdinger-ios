import SwiftUI


enum DetailEditViewMode {
    case edit, create
}

struct DetailEditView: View {
    @Binding var scrum: DailyScrum
    @State private var attendeeName: String = ""
    var mode: DetailEditViewMode = .edit
    
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
                
                ThemePickerView(theme: $scrum.theme)
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
        .navigationTitle(mode == .edit ? "Edit" : "New")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(mode == .edit ? "Cancel" : "Dismiss") { dismiss() }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button(mode == .edit ? "Done" : "Add", action: onDone)
                .font(.headline)
                .disabled(scrum.title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            }
        }
    }
}

#Preview {
    NavigationView {
        DetailEditView(scrum: .constant(DailyScrum())) {}
    }
}
