import SwiftUI
import SwiftData

struct StatisticView: View {
    @Environment(\.modelContext) var modelContext
    @Query var meals: [Meal]
    @State private var selectedDate = Date()
    @State private var mealLogShown = false
    
    #warning("Add Meal Edit")
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                VStack {
                    MonthView(selectedDate: $selectedDate)
                        .padding(.vertical)
                    
                    ProgressInformationView(calories: totalCalories)
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
                        
                        if mealByDate().isEmpty {
                            ContentUnavailableView("You didn't log your meal",
                                                   systemImage: "waveform.path.ecg.rectangle", description: Text("If you forgot to log your meal go to that date and press the plus button 😊"))
                        } else {
                            List {
                                ForEach(mealByDate()) { item in
                                    MealLogItem(calories: item.calories, meal: item.meal, date: item.date)
                                }
                                .onDelete(perform: deleteMeal)
                            }
                            .listStyle(.plain)
                        }
                    }
                    .sheet(isPresented: $mealLogShown, content: {
                        MealLogStationView(mealLogShown: $mealLogShown, selectedDate: $selectedDate)
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
        mealByDate().reduce(0) {
            $0 + $1.calories
        }
    }
    
    func mealByDate() -> [Meal] {
        let filteredMeals = meals.filter { Calendar.current.isDate($0.date, inSameDayAs: selectedDate)}
        return filteredMeals
    }
}
