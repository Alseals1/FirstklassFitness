import SwiftUI

struct DayView: View {
    @State var date: Date
  
    var body: some View {
        HStack {
            VStack {
                Text(getWeekDay(from: date))
                Text(getDay(from: date))
                    .lineLimit(1)
            }
            .foregroundColor(.white)
            .frame(width: 40, height: 64)
            .background(Capsule()
                .fill(getDay(from: date) == getDay(from: .now) ? Color.lavender : Color.gray.opacity(0.5)))
        }
    }
    
    private func getWeekDay(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE"
        dateFormatter.string(from: date)
        
        return date.formatted(Date.FormatStyle().weekday(.narrow))
    }
    
    private func getDay(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        return dateFormatter.string(from: date)
    }
}
#Preview {
    DayView(date: .now)
}


