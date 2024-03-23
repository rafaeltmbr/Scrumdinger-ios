import SwiftUI

struct CardView: View {
    let dailyScrum: DailyScrum
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(dailyScrum.title)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
            
            Spacer()
            
            HStack {
                Label("\(dailyScrum.attendees.count)", systemImage: "person.3")
                    .accessibilityLabel("\(dailyScrum.attendees.count) attendees")
                
                Spacer()
                Label("\(dailyScrum.lengthInMinutes)", systemImage: "clock")
                    .labelStyle(.trailingIcon)
                    .accessibilityLabel("\(dailyScrum.lengthInMinutes) minute meeting")
            }
            .font(.caption)
        }
        .padding()
        .foregroundColor(dailyScrum.theme.accentColor)
    }
}


#Preview {
    CardView(dailyScrum: DailyScrum.sampleData.first!)
        .background(DailyScrum.sampleData.first!.theme.mainColor)
        .frame(width: 400, height: 60)
}
