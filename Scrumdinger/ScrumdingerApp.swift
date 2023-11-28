import SwiftUI

@main
struct ScrumdingerApp: App {
    @State var scrums = DailyScrum.sampleData
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}
