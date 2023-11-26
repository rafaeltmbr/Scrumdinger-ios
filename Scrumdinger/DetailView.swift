import SwiftUI

struct DetailView: View {
    var scrum: DailyScrum
    @State private var isPresentingEditView = false
    
    var body: some View {
        List {
            Section(header: Text("Meeting info")) {
                NavigationLink(destination: MeetingView()) {
                    Label("Start meeting", systemImage: "timer")
                        .foregroundColor(.accentColor)
                        .font(.headline)
                }
                
                HStack {
                    Label("Duration", systemImage: "clock")
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
                        .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                }
                .accessibilityElement(children: .combine)
            }
            
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees) {attendee in
                    Label(attendee.name, systemImage: "person")
                }
            }
        }
        .navigationTitle(scrum.title)
        .toolbar {
            Button("Edit") {
               isPresentingEditView = true
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationStack {
                DetailEditView()
                    .navigationTitle(scrum.title)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                        }
                        
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Save") {
                                
                                isPresentingEditView = false
                            }
                        }
                    }
            }
            
        }
    }
}

#Preview {
    NavigationStack {
        DetailView(scrum: DailyScrum.sampleData.first!)
    }
}
