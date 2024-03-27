import Foundation

@MainActor
class ScrumStore: ObservableObject {
    @Published var scrums: [DailyScrum] = []
    
    private static func loadURL() throws -> URL {
        try FileManager.default.url(
            for: .documentDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: false
        ).appendingPathComponent("scrums.data")
    }
    
    func load() async throws {
        let task = Task<[DailyScrum], Error> {
            let url = try Self.loadURL()
            guard let data = try? Data(contentsOf: url) else { return [] }
            let dailyScrums = try JSONDecoder().decode([DailyScrum].self, from: data)
            return dailyScrums
        }
        
        scrums = try await task.value
    }
    
    func save() async throws {
        let task = Task<(), Error> {
            let url = try Self.loadURL()
            let data = try JSONEncoder().encode(scrums)
            try data.write(to: url)
        }
        
        try await task.value
    }
}
