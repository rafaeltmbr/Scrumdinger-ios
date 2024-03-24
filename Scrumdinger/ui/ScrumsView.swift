import SwiftUI

struct ScrumsView: View {
    @Binding var scrums: [DailyScrum]
    
    var body: some View {
        NavigationStack {
            List($scrums) {scrum in
                NavigationLink(destination: DetailView(scrum: scrum)) {
                    CardView(dailyScrum: scrum.wrappedValue)
                }
                .listRowBackground(scrum.wrappedValue.theme.mainColor)
            }
            .navigationTitle("Scrums")
            .toolbar {
                Button(action: { }) {
                    Image(systemName: "plus")
                        .font(.headline)
                }
                .accessibilityLabel("New scrum")
                .disabled(true)
            }
        }
    }
}

#Preview {
    ScrumsView(scrums: .constant(DailyScrum.sampleData))
}
