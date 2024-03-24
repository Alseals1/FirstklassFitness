import SwiftData
import SwiftUI

@main
struct FirstKlassFitnessApp: App {

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
            }
        }
        .modelContainer(for: Meal.self)
    }
}
