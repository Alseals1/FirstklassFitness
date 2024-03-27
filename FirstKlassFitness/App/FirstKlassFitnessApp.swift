import SwiftData
import SwiftUI

@main
struct FirstKlassFitnessApp: App {

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
            }
            .preferredColorScheme(.dark)
        }
        .modelContainer(for: Meal.self)
    }
}
