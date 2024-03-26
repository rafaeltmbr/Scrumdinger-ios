import SwiftUI

struct DetailView: View {
    @Binding var scrum: DailyScrum
    @State private var editingScrum = DailyScrum()
    @State private var isEditing: Bool = false
    
    var body: some View {
        VStack {
            List {
                Section("Info") {
                    NavigationLink(destination: MeetingView(scrum: scrum)) {
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
        }
        .navigationTitle(scrum.title)
        .toolbar {
            Button("Edit") {
                editingScrum = scrum
                isEditing = true
            }
        }
        .sheet(isPresented: $isEditing) {
            NavigationView {
                DetailEditView(scrum: $editingScrum) {
                    scrum = editingScrum
                    isEditing = false
                }
            }
        }
    }
}

#Preview {
    NavigationView {
        DetailView(scrum: .constant(DailyScrum.sampleData.first!))
    }
}
