import SwiftData
import SwiftUI

@main
struct FirstKlassFitnessApp: App {

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                IntroView()
            }
            .preferredColorScheme(.dark)
        }
        .modelContainer(for: [Meal.self, Notes.self])
    }
}
