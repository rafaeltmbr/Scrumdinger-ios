import SwiftUI

struct ScrumsView: View {
    @Binding var scrums: [DailyScrum]
    @State private var newScrum = DailyScrum()
    @State private var isCreatingScrum: Bool = false
    
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
                Button {
                    newScrum = DailyScrum()
                    isCreatingScrum = true
                } label: {
                    Image(systemName: "plus")
                        .font(.headline)
                }
                .accessibilityLabel("New scrum")
            }
            .sheet(isPresented: $isCreatingScrum) {
                NavigationView {
                    DetailEditView(scrum: $newScrum, mode: .create) {
                        scrums.append(newScrum)
                        isCreatingScrum = false
                    }
                }
            }
        }
    }
}

#Preview {
    ScrumsView(scrums: .constant(DailyScrum.sampleData))
}
