import SwiftUI
import SwiftData

struct StatisticView: View {
    @Environment(\.modelContext) var modelContext
    @Query var meals: [Meal]
    
    
    @State private var mealLogShown = false
   // @State var mealDemo: [Meal] = demo
    
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
                        
                            List {
                                
                                ForEach(meals) { item in
                                    MealLogItem(calories: item.calories, meal: item.meal, date: item.date)
                                }
                                .onDelete(perform: deleteMeal)
                            }
                            .listStyle(.plain)
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

extension StatisticView {
    func deleteMeal(_ indexSet: IndexSet) {
        for index in indexSet {
            let meal  = meals[index]
            modelContext.delete(meal)
        }
    }
}

#Preview {
    StatisticView()
}

extension StatisticView {
    var totalCalories: Int {
        meals.reduce(0) {
            $0 + $1.calories
        }
    }
}
