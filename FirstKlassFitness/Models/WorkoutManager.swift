import Foundation

import Foundation

class ExerciseManager {
    static func loadExercises(completion: @escaping ([Exercise]) -> Void) {
        if let url = Bundle.main.url(forResource: "exercises", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let exercises = try JSONDecoder().decode([Exercise].self, from: data)
                completion(exercises)
            } catch {
                print("Error loading JSON data: \(error)")
                completion([])
            }
        }
    }
}

