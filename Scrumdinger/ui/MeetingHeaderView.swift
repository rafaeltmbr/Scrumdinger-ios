import SwiftUI

struct MeetingHeaderView: View {
    var secondsElapsed: Int
    var secondsRemaining: Int
    
    private var secondsTotal: Int {
        secondsElapsed + secondsRemaining
    }
    
    private var minutesTotal: Int {
        secondsTotal / 60
    }

    private var progress: Double {
        Double(secondsElapsed) / Double(secondsTotal)
    }

    var body: some View {
        VStack {
            ProgressView(value: progress)
                .padding(.vertical, 8)
                .padding(.horizontal)
                .background(.black)
                .cornerRadius(.infinity)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed").font(.caption)
                    Label("\(secondsElapsed)", systemImage: "hourglass.tophalf.fill")
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining").font(.caption)
                    Label("\(secondsRemaining)", systemImage: "hourglass.bottomhalf.fill")
                        .labelStyle(.trailingIcon)
                }
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Time remaining")
            .accessibilityValue("\(minutesTotal) minutes")
        }
    }
}

#Preview {
    MeetingHeaderView(secondsElapsed: 100, secondsRemaining: 200)
}
