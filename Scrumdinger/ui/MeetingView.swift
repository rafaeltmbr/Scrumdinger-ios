import SwiftUI

struct MeetingView: View {
    var body: some View {
        VStack {
            ProgressView(value: 10, total: 100)
            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed").font(.caption)
                    Label("300", systemImage: "hourglass.tophalf.fill")
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining").font(.caption)
                    Label("600", systemImage: "hourglass.bottomhalf.fill")
                        .labelStyle(.trailingIcon)
                }
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Time remaining")
            .accessibilityValue("10 minutes")
            
            Circle().strokeBorder(lineWidth: 24)
            
            HStack {
                Text("Speaker 1 of 3")
                Spacer()
                Button("", systemImage: "forward.fill") { }.accessibilityLabel("Next speaker")
            }
        }.padding()
    }
}

#Preview {
    MeetingView()
}
 
