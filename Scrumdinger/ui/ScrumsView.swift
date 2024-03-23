import SwiftUI

struct ScrumsView: View {
    var scrums: [DailyScrum]
    
    var body: some View {
        NavigationStack {
            List(scrums) {scrum in
                NavigationLink(destination: DetailView(scrum: scrum)) {
                    CardView(dailyScrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Scrums")
            .toolbar {
                Button(action: {}) {
                    Image(systemName: "plus")
                        .font(.headline)
                }
                .accessibilityLabel("New scrum")
            }
        }
    }
}

#Preview {
    ScrumsView(scrums: DailyScrum.sampleData)
}
