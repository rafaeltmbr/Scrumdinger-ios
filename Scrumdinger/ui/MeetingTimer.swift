import Foundation

class MeetingTimer: ObservableObject {
    @Published private(set) var secondsElapsed: Int = -1
    private(set) var task: Task<(), Never>!
    
    var secondsReamining: Int {
        guard let scrum else { return 0}
        return scrum.lengthInSeconds - secondsElapsed
    }

    var currentSpeakerIndex: Int {
        guard let scrum else { return 0 }

        let progress = Double(secondsElapsed) / max(Double(scrum.lengthInSeconds), 1)
        let index = Int(floor(progress * Double(scrum.attendees.count)))
        return index
    }
    
    var currentSpeaker: Int {
        currentSpeakerIndex + 1
    }
    
    var isSkipAllowed: Bool {
        guard let scrum else { return false }

        return currentSpeakerIndex < scrum.attendees.count - 1
    }

    private var scrum: DailyScrum? = nil

    func start(scrum: DailyScrum, speakerTimeChanged: @escaping () -> Void = {}) {
        guard self.scrum == nil else { return }
        self.scrum = scrum
        
        task = Task {@MainActor in
            while secondsElapsed < scrum.lengthInSeconds {
                do {
                    let previousSpeakerIndex = currentSpeakerIndex
                    secondsElapsed += 1

                    if previousSpeakerIndex != currentSpeakerIndex && secondsElapsed > 1 {
                        speakerTimeChanged()
                    }

                    try await Task.sleep(nanoseconds: 1_000_000_000)
                } catch {
                    break
                }
            }
        }
    }
    
    func stop() {
        task.cancel()
    }

    func skip() {
        guard isSkipAllowed else { return }
        secondsElapsed = scrum!.lengthInSeconds / scrum!.attendees.count * (currentSpeakerIndex + 1)
    }
}

private extension DailyScrum {
    var lengthInSeconds: Int { lengthInMinutes * 60 }
}
