import Foundation

struct ErrorWrapper: Identifiable {
    let id: UUID = UUID()
    var error: Error
    var guidance: String
}
