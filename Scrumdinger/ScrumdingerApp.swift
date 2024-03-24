import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums: [DailyScrum] = DailyScrum.sampleData
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}
