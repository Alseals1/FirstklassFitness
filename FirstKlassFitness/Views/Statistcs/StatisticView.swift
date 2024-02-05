import SwiftUI

struct StatisticView: View {
    @State private var mealLogShown = false
    @State var meals: [Meal] = demo
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                VStack {
                    MonthView()
                        .padding(.vertical)
                    
                    ProgressInformationView(calories: totalCalories, goalCalories: 3000)
                        .padding(15)
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Meal Log")
                                .foregroundColor(.lavender)
                                .font(.system(size: 20))
                            
                            Spacer()
                            
                            AddMealButton(action: {
                                mealLogShown.toggle()
                            }, image: "plus", imageColor: .lavender)
                        }
                        
                        ScrollView {
                            ForEach(meals) { item in
                                MealLogItem(calories: item.calories, meal: item.meal)
                            }
                        }
                    }
                    .sheet(isPresented: $mealLogShown, content: {
                        MealLogStationView(mealLogShown: $mealLogShown)
                            .presentationDetents([.fraction(0.50), .medium])
                    })
                    
                    Spacer()
                }
            }
        }
    }
}

struct MealLogItem: View {
    var calories: Int
    var meal: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text(meal)
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundStyle(.lighterGray)
                    Spacer()
                    Text("10:00")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundStyle(.lavender)
                }
                HStack(spacing: 4) {
                    Text("Calories:")
                        .font(.system(size: 17, weight: .semibold))
                    .foregroundStyle(.lighterGray)
                    
                    Text("\(calories)")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundStyle(.lavender)
                }
            }
            .padding()
        }
        .frame(height: 76)
        .background(RoundedRectangle(cornerRadius: 12)
            .fill(Color.charcoalGray))
        
    }
}

#Preview {
    StatisticView(meals: [Meal(calories: 300, meal: "Chicken", date: .now)])
}

extension StatisticView {
    var totalCalories: Int {
        meals.reduce(0) {
            $0 + $1.calories
        }
    }
}
