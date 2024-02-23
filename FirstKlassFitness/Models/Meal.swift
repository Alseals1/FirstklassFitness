import Foundation

struct Meal: Identifiable {
    var id = UUID()
    var calories: Int
    var meal: String
    var date: Date
    
    init(id: UUID = UUID(), calories: Int, meal: String, date: Date = .now) {
        self.id = id
        self.calories = calories
        self.meal = meal
        self.date = date
    }
}

var demo: [Meal] = [
    Meal(calories: 141, meal: "Rice"),
    Meal(calories: 300, meal: "Chicken"),
    Meal(calories: 90, meal: "Plant Base Wings"),
    Meal(calories: 30, meal: "Brocoli"),
    Meal(calories: 50, meal: "Orange")
]
