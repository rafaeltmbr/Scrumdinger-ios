import SwiftUI

struct ScrumsView: View {
    var scrums: [DailyScrum]
    
    var body: some View {
        List(scrums) {scrum in
            CardView(dailyScrum: scrum)
                .listRowBackground(scrum.theme.mainColor)
        }
    }
}

#Preview {
    ScrumsView(scrums: DailyScrum.sampleData)
}
