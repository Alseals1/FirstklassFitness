import Foundation

struct Meal: Identifiable {
    var id = UUID()
    var calories: Int
    var meal: String
    var date: Date

}

var demo: [Meal] = [
    Meal(calories: 141, meal: "Rice" , date: .now),
    Meal(calories: 300, meal: "Chicken" , date: .now),
    Meal(calories: 90, meal: "Plant Base Wings", date: .now),
    Meal(calories: 30, meal: "Brocoli" , date: .now),
    Meal(calories: 50, meal: "Orange" , date: .now)
]
