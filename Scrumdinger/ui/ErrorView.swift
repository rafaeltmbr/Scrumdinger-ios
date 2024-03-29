import SwiftUI

struct ErrorView: View {
    var errorWrapper: ErrorWrapper
    @Environment(\.dismiss) var dismiss: DismissAction
    
    var body: some View {
        VStack {
            Text("An error has occurred!")
                .font(.title)
                .padding(.bottom)
            
            Text(errorWrapper.error.localizedDescription)
                .font(.headline)
                .padding(.bottom)
            
            Text(errorWrapper.guidance)
                .font(.caption)
            
            Spacer()
        }
        .padding()
        .background(.thinMaterial)
        .cornerRadius(16)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Dismiss") { dismiss() }
            }
        }
    }
}

#Preview {
    enum PreviewError: Error {
        case errorRequired
    }
    
    let error = ErrorWrapper(
        error: PreviewError.errorRequired,
        guidance: "You can safely ignore this error."
    )
    
    return NavigationView {
        ErrorView(errorWrapper: error)
    }
}
