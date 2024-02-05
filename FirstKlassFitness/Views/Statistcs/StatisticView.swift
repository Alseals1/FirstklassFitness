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
                                print(Date.now)
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
