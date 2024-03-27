import SwiftUI

@main
struct ScrumdingerApp: App {
    @StateObject private var store = ScrumStore()
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $store.scrums)
                .task {
                    do {
                        try await store.load()
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
                .onChange(of: scenePhase) {phase, _ in
                    if phase != .active {
                        return
                    }
                       
                    Task {
                        do {
                            try await store.save()
                        } catch {
                            fatalError(error.localizedDescription)
                        }
                    }
                }
        }
    }
}
