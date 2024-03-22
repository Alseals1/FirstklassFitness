import SwiftUI

struct MonthView: View {
    @State private var currentDate = Date()
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    currentDate = Calendar.current.date(byAdding: .weekOfMonth, value: -1, to: currentDate)!
                }) {
                    ZStack {
                        Image(systemName: "chevron.left")
                    }
                    .padding(10)
                    .background(Color.gray.opacity(0.5))
                    .clipShape(Circle())
                }
                
                Spacer()
                
                Text(getMonth(from: currentDate))
                
                Spacer()
                
                Button(action: {
                    currentDate = Calendar.current.date(byAdding: .weekOfMonth, value: 1, to: currentDate)!
                }) {
                    ZStack {
                        Image(systemName: "chevron.right")
                    }
                    .padding(10)
                    .background(Color.gray.opacity(0.5))
                    .clipShape(Circle())
                }
            }
            .foregroundColor(.white)
            .padding(.horizontal, 24)
            .padding(.bottom, 29)
            
            HStack {
                ForEach(getDatesForCurrentWeek(), id: \.self) { date in
                    
                        DayView(date: date)
                }
            }
        }
    }
    
    private func getMonth(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM"
        return dateFormatter.string(from: date)
    }
    
    private func getDatesForCurrentWeek() -> [Date] {
        let calendar = Calendar.current
        let startOfWeek = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: currentDate))!
        return (0..<7).compactMap { calendar.date(byAdding: .day, value: $0, to: startOfWeek) }
    }
}

#Preview {
    MonthView()
}
