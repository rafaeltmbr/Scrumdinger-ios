import SwiftUI
import AVFoundation

struct MeetingView: View {
    @StateObject private var timer = MeetingTimer()
    var scrum: DailyScrum
    
    private let player = AVPlayer.sharedDingPlayer
    
    var body: some View {
        VStack {
            MeetingHeaderView(
                secondsElapsed: timer.secondsElapsed,
                secondsRemaining: timer.secondsReamining
            ).padding(.horizontal)

            Circle().strokeBorder(lineWidth: 24)
            
            HStack {
                if timer.isSkipAllowed {
                    Text("Speaker \(timer.currentSpeaker) of \(scrum.attendees.count)")
                    Spacer()
                    Button("", systemImage: "forward.fill") {
                        timer.skip()
                    }
                    .accessibilityLabel("Next speaker")
                    .disabled(!timer.isSkipAllowed)
                    .opacity(timer.isSkipAllowed ? 1.0 : 0.5)
                } else {
                    Text(timer.secondsReamining > 0 ? "Last speaker" : "No more speakers")
                }
            }
            .padding(.horizontal)
        }
        .padding(.vertical)
        .background(scrum.theme.mainColor)
        .foregroundColor(scrum.theme.accentColor)
        .cornerRadius(16)
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            timer.start(scrum: scrum) {
                player.seek(to: .zero)
                player.play()
            }
        }
    }
}

#Preview {
    MeetingView(scrum: DailyScrum.sampleData.first!)
}
 
