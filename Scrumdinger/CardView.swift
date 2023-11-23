import SwiftUI

struct CardView: View {
    let scrum: DailyScrum
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(scrum.title)
                .font(.headline)
                .accessibilityAddTraits(/*@START_MENU_TOKEN@*/.isHeader/*@END_MENU_TOKEN@*/)
            
            Spacer()
            
            HStack {
                Label("\(scrum.attendees.count)", systemImage: "person.3")
                    .accessibilityLabel("\(scrum.attendees.count) attendees")
                
                Spacer()
                        
                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
                    .labelStyle(TrailingIconLabelStyle())
                    .accessibilityLabel("\(scrum.lengthInMinutes) minute meeting")
            }
            .font(.caption)
        }
        .frame(height: 60)
        .padding()
        .background(scrum.theme.mainColor)
        .foregroundColor(scrum.theme.accentColor)
    }
}

#Preview {
    CardView(scrum: DailyScrum.sampleData[2])
}
