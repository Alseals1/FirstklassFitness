import SwiftUI

struct StatisticView: View {
    @State private var mealLogShown = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                VStack {
                    MonthView()
                        .padding(.vertical)
                    
                    
                    ProgressInformation(calories: 1000, goalCalories: 3000)
                        .padding(15)
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Meal Log")
                                .foregroundColor(.lavender)
                                .font(.system(size: 20))
                            
                            Spacer()
                            
                            GlobalButton(action: {
#warning("Need Action")
                            }, image: "plus", imageColor: .lavender)
                        }
                        
                    }
                    
                }
                Spacer()
            }
        }
    }
}


// MARK: This section need refactoring
///MonthView
///DailyView
///GlobalButton
///ProgressInformation
///AddMealSheet



struct GlobalButton: View {
    let action: () -> Void
    let image: String
    let imageColor: Color
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            ZStack {
                Circle()
                    .stroke()
                    .fill(imageColor)
                    .frame(height: 25)
                Image(systemName: image)
                    .padding()
                    .foregroundColor(.white)
                    .frame(height: 20)
            }
        })
    }
}

struct ProgressInformation: View {
    var calories: Int
    var goalCalories: Int
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(lineWidth: 8)
                    .fill(Gradient(colors: [.royalPurple, .lavender]).opacity(0.5))
                
                Circle()
                    .trim(from: 0, to: Double(calories) / Double(goalCalories))
                    .stroke(lineWidth: 8)
                    .fill(calories <= goalCalories ? Gradient(colors: [.royalPurple, .lavender]) : Gradient(colors: [.red, .red.opacity(0.5)]))
                    .rotationEffect(.degrees(-90))
                
                VStack(spacing: 5){
                    HStack {
                        Text("\(calories)")
                            .font(.system(size: 36))
                        Text("Cal")
                            .font(.system(size: 24))
                    }
                    Text("Active Calories")
                        .font(.system(size: 13))
                    
                    if goalCalories < calories  {
                        Text("You are over your goal\n calories for today")
                            .foregroundColor(.red)
                            .font(.system(size: 15, weight: .semibold))
                            .multilineTextAlignment(.center)
                    }
                }
                .foregroundColor(.white)
            }
        }
        .frame(width: 300)
    }
}

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
            
            HStack(spacing: 25) {
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
    StatisticView()
}
