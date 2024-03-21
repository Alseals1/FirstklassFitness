import Foundation

enum Difficulty: String {
    case beginner = "Beginner"
    case intermediate = "Intermediate"
    case advanced = "Advanced"
}
// Define a struct to represent a single exercise
struct Exercise: Identifiable {
    var id = UUID()
    var name: String
    var workoutImage: String
    var duration: Int
    var levelofExercise: String
    var image: String 
  
}

// Define a struct to represent a workout session
struct WorkoutSession {
    var exercises: [Exercise] // Array of exercises in the workout session
    var rounds: Int // Number of rounds in the workout session
}

// Define a struct to represent a user's workout history
struct WorkoutHistoryItem: Identifiable {
    var id = UUID() // Unique identifier for each workout history item
    var date: Date // Date of the workout session
    var duration: Int // Total duration of the workout session in seconds
    var roundsCompleted: Int // Number of rounds completed in the workout session
}
let mockExercise: Exercise = Exercise(name: "Jumping Jacks", workoutImage: "image1", duration: 30, levelofExercise: "intermediate", image: "jumping_jacks")

let mockExercises: [Exercise] = [
    Exercise(name: "Jumping Jacks", workoutImage: "image1", duration: 30, levelofExercise: "intermediate", image: "jumping_jacks"),
    Exercise(name: "Burpees", workoutImage: "image1", duration: 45, levelofExercise: "intermediate", image: "burpees"),
    Exercise(name: "Mountain Climbers", workoutImage: "image1", duration: 30, levelofExercise: "intermediate", image: "mountain_climbers"),
    Exercise(name: "High Knees", workoutImage: "image1", duration: 30, levelofExercise: "intermediate", image: "high_knees"),
    Exercise(name: "Plank", workoutImage: "image1", duration: 60, levelofExercise: "intermediate", image: "plank"),
    Exercise(name: "Squats", workoutImage: "image1", duration: 45, levelofExercise: "intermediate", image: "squats"),
    Exercise(name: "Push-ups", workoutImage: "image1", duration: 30, levelofExercise: "intermediate", image: "push_ups"),
    Exercise(name: "Lunges", workoutImage: "image1", duration: 45, levelofExercise: "intermediate", image: "lunges"),
    Exercise(name: "Sit-ups", workoutImage: "image1", duration: 30, levelofExercise: "intermediate", image: "sit_ups"),
    Exercise(name: "Russian Twists", workoutImage: "image1", duration: 30, levelofExercise: "intermediate", image: "russian_twists"),
    Exercise(name: "Jump Squats", workoutImage: "image1", duration: 45, levelofExercise: "intermediate", image: "jump_squats"),
    Exercise(name: "Plank Jacks", workoutImage: "image1", duration: 30, levelofExercise: "intermediate", image: "plank_jacks"),
    Exercise(name: "Bicycle Crunches", workoutImage: "image1", duration: 30, levelofExercise: "intermediate", image: "bicycle_crunches"),
    Exercise(name: "Side Plank (Left)", workoutImage: "image1", duration: 30, levelofExercise: "intermediate", image: "side_plank_left"),
    Exercise(name: "Side Plank (Right)", workoutImage: "image1", duration: 30, levelofExercise: "intermediate", image: "side_plank_right"),
    Exercise(name: "Wall Sit", workoutImage: "image1", duration: 60, levelofExercise: "intermediate", image: "wall_sit"),
    Exercise(name: "Superman", workoutImage: "image1", duration: 30, levelofExercise: "intermediate", image: "superman"),
    Exercise(name: "Tricep Dips", workoutImage: "image1", duration: 30, levelofExercise: "intermediate", image: "tricep_dips"),
    Exercise(name: "Leg Raises", workoutImage: "image1", duration: 30, levelofExercise: "intermediate", image: "leg_raises"),
    Exercise(name: "Flutter Kicks", workoutImage: "image1", duration: 30, levelofExercise: "intermediate", image: "flutter_kicks"),
    Exercise(name: "Calf Raises", workoutImage: "image1", duration: 30, levelofExercise: "intermediate", image: "calf_raises"),
    Exercise(name: "Reverse Crunches", workoutImage: "image1", duration: 30, levelofExercise: "intermediate", image: "reverse_crunches"),
    Exercise(name: "Bear Crawl", workoutImage: "image1", duration: 45, levelofExercise: "intermediate", image: "bear_crawl"),
    Exercise(name: "Skater Jumps", workoutImage: "image1", duration: 45, levelofExercise: "intermediate", image: "skater_jumps"),
    Exercise(name: "Plank to Push-up", workoutImage: "image1", duration: 45, levelofExercise: "intermediate", image: "plank_to_push_up")
]

