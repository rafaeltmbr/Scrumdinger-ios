import SwiftUI

struct ThemePicker: View {
    @Binding var theme: Theme

    var body: some View {
        Picker("Theme", selection: $theme) {
            ForEach(Theme.allCases) {theme in
                ThemeView(theme: theme)
                    .tag(theme)
            }
        }
        .pickerStyle(.navigationLink)
    }
}

#Preview {
    ThemePicker(theme: .constant(.buttercup))
}
