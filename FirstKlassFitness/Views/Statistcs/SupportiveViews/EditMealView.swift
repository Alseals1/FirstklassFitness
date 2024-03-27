import SwiftUI
import SwiftData

struct EditMealView: View {
    #warning("Fix Edit")
    
    @Environment(\.modelContext) var modelContext
    @State private var mealTextField: String = ""
    @State private var caloriesTextField: String = ""
    var meal: String
    var calories: String
   
    var body: some View {
            VStack {
                Text("Edit Your Meal")
                
                Form {
                    Section("Meal") {
                        TextField(meal, text: $mealTextField)
                    }
                   
                    Section("Calories") {
                        TextField(calories, text: $caloriesTextField)
                    }
                }
                
                Button(action: {
                    func addMeal() {
                        let calories = self.caloriesTextField
                        let meal = self.mealTextField
                        let newMeal = Meal(calories: Int(calories) ?? 0, meal: meal)
                        
                        modelContext.insert(newMeal)
                    }
                }, label: {
                    Text("Add Meal")
                })
            }
        }
    }

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Meal.self, configurations: config)
        
       
        return EditMealView(meal: "Chicken", calories: "\(300)")
                                } catch {
            fatalError("Fail to create model")
        }
   
}
