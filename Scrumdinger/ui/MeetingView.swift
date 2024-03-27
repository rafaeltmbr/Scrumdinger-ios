import SwiftUI
import AVFoundation

struct MeetingView: View {
    @StateObject private var timer = MeetingTimer()
    @Binding var scrum: DailyScrum
    
    private let player = AVPlayer.sharedDingPlayer
    
    var body: some View {
        VStack {
            MeetingHeaderView(
                secondsElapsed: timer.secondsElapsed,
                secondsRemaining: timer.secondsReamining
            ).padding(.horizontal)

            Circle().strokeBorder(lineWidth: 24)

            footer
        }
        .padding(.vertical)
        .background(scrum.theme.mainColor)
        .foregroundColor(scrum.theme.accentColor)
        .cornerRadius(16)
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .onAppear(perform: startScrum)
        .onDisappear(perform: stopScrum)
    }

    var footer: some View {
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
    
    private func startScrum() {
        timer.start(scrum: scrum) {
            player.seek(to: .zero)
            player.play()
        }
        scrum.history.append(DailyScrum.History(attendees: scrum.attendees))
    }
    
    private func stopScrum() {
        timer.stop()
    }
}

#Preview {
    MeetingView(scrum: .constant(DailyScrum.sampleData.first!))
}
 
