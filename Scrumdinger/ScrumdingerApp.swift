import SwiftUI

@main
struct ScrumdingerApp: App {
    @StateObject private var store = ScrumStore()
    @State private var errorWrapper: ErrorWrapper? = nil
    @Environment(\.scenePhase) private var scenePhase

    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $store.scrums)
            .task {
                do {
                    try await store.load()
                } catch {
                    errorWrapper = ErrorWrapper(error: error, guidance: "Failed to load scrums. Try again.")
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
                        errorWrapper = ErrorWrapper(error: error, guidance: "Failed to save scrums. Try again.")
                    }
                }
            }
            .sheet(item: $errorWrapper) {
                store.scrums = []
            } content: { error in
                NavigationView {
                    ErrorView(errorWrapper: error)
                }
            }
        }
    }
}
