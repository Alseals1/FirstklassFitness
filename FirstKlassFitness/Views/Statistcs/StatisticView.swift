import SwiftUI
import SwiftData

struct StatisticView: View {
    @Environment(\.modelContext) var modelContext
    @Query var meals: [Meal]
    
    @State private var selectedDate = Date()
    @State private var mealLogShown = false
    @State var mealToEdit: Meal?
    
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
                    
                    mealLog
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    StatisticView()
}

/// Views
extension StatisticView {
    var mealLog: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Meal Log")
                    .foregroundColor(.lavender)
                    .font(.custom("Oswald-SemiBold", size: 20))
                
                Spacer()
                
                AddMealButton(action: {
                    mealLogShown.toggle()
                }, image: "plus", imageColor: .lavender)
            }
            
            if mealByDate().isEmpty {
                ContentUnavailableView("You didn't log your meal",
                                       systemImage: "waveform.path.ecg.rectangle", description: Text("If you forgot to log your meal go to that date and press the plus button 😊"))
            } else {
                meal
            }
        }
        .sheet(isPresented: $mealLogShown, content: {
            MealLogStationView(mealLogShown: $mealLogShown, selectedDate: $selectedDate)
                .presentationDetents([.fraction(0.50), .medium])
        })
        .sheet(item: $mealToEdit) { item in
            MealEditView(meal: item)
        }
    }
    
    var meal: some View {
        List {
            ForEach(mealByDate()) { item in
                MealLogItem(calories: item.calories, meal: item.meal, date: item.date)
                    .onTapGesture {
                        mealToEdit = item
                    }
            }
            .onDelete(perform: deleteMeal)
        }
        .listStyle(.plain)
        .navigationBarItems(trailing: EditButton())
    }
    
}

/// Function
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
    
    func deleteMeal(_ indexSet: IndexSet) {
        for index in indexSet {
            let meal  = meals[index]
            modelContext.delete(meal)
        }
    }
}
