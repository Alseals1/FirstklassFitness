import Foundation

// Define a class to manage user's workout data and history
class WorkoutManager: ObservableObject {
    @Published var workoutSessions: [WorkoutHistoryItem] = [] // Array to store workout history items
    
    // Function to add a workout history item to the workoutSessions array
    func addWorkoutSession(_ session: WorkoutHistoryItem) {
        workoutSessions.append(session)
    }
    
    // Function to remove a workout history item from the workoutSessions array
    func removeWorkoutSession(at index: Int) {
        workoutSessions.remove(at: index)
    }
}
