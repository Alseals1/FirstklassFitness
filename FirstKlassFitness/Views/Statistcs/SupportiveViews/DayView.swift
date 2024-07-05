import SwiftUI

struct DayView: View {
    @State var date: Date
    @State var selected: Bool
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text(date.getWeekDay(from: date))
                    Text(date.getDay(from: date))
                        .lineLimit(1)
                }
                .font(.custom("Oswald-Bold", size: 16))
                .foregroundColor(.white)
                .frame(width: 40, height: 64)
            }
            .background(Capsule()
                .fill(date.getWeekDay(from: date) == Date().getWeekDay(from: .now) && date.getDay(from: date) == Date().getDay(from: .now) ? .lavender : Color.gray.opacity(0.5))
            )
            
        }
    }
}



