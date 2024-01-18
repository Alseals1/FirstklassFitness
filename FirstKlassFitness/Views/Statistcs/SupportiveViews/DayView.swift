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
            .background(Capsule()
                .fill(Color.gray.opacity(0.5))
                .frame(width: 30, height: 55))
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
