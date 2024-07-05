import Foundation
import SwiftData

@Model
class Meal: Identifiable {
    var id = UUID()
    var calories: Int
    var meal: String
    var date: Date
    
    init(id: UUID = UUID(), calories: Int = 0, meal: String = "", date: Date = .now) {
        self.id = id
        self.calories = calories
        self.meal = meal
        self.date = date
    }
}

extension Meal {
    var stringCal: String {
        return "\(calories)"
    }
}

var demo: [Meal] = [
    Meal(calories: 141, meal: "Rice", date: .now),
    Meal(calories: 300, meal: "Chicken", date: .now),
    Meal(calories: 90, meal: "Plant Base Wings", date: .now),
    Meal(calories: 30, meal: "Brocoli", date: .now),
    Meal(calories: 50, meal: "Orange", date: .now)
]
