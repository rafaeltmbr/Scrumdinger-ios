import SwiftUI

struct ThemePickerView: View {
    @Binding var theme: Theme

    var body: some View {
        HStack {
            Picker("Theme", selection: $theme) {
                ForEach(Theme.allCases) {
                    Text($0.name)
                        .padding(4)
                        .frame(maxWidth: .infinity)
                        .background($0.mainColor)
                        .foregroundColor($0.accentColor)
                        .cornerRadius(4)
                        .tag($0)
                }
            }
            .pickerStyle(.navigationLink)
        }
    }
}

#Preview {
    NavigationView {
        ThemePickerView(theme: .constant(.sky)).padding()
    }
}
