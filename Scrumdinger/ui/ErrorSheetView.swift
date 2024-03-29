import SwiftUI

struct ErrorSheetView: View {
    var errorWrapper: ErrorWrapper
    
    var body: some View {
        
            ErrorView(errorWrapper: error)
    }
}

#Preview {
    
    
    ErrorSheetView(errorWrapper: <#T##ErrorWrapper#>)
}
