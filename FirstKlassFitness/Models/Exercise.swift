import Foundation

// Define a struct to represent a single exercise
struct Exercise: Identifiable {
    var id = UUID() // Unique identifier for each exercise
    var name: String // Name of the exercise
    var duration: Int // Duration of the exercise in seconds
    var image: String // Image name for the exercise
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

let mockExercises: [Exercise] = [
    Exercise(name: "Jumping Jacks", duration: 30, image: "jumping_jacks"),
    Exercise(name: "Burpees", duration: 45, image: "burpees"),
    Exercise(name: "Mountain Climbers", duration: 30, image: "mountain_climbers"),
    Exercise(name: "High Knees", duration: 30, image: "high_knees"),
    Exercise(name: "Plank", duration: 60, image: "plank"),
    Exercise(name: "Squats", duration: 45, image: "squats"),
    Exercise(name: "Push-ups", duration: 30, image: "push_ups"),
    Exercise(name: "Lunges", duration: 45, image: "lunges"),
    Exercise(name: "Sit-ups", duration: 30, image: "sit_ups"),
    Exercise(name: "Russian Twists", duration: 30, image: "russian_twists"),
    Exercise(name: "Jump Squats", duration: 45, image: "jump_squats"),
    Exercise(name: "Plank Jacks", duration: 30, image: "plank_jacks"),
    Exercise(name: "Bicycle Crunches", duration: 30, image: "bicycle_crunches"),
    Exercise(name: "Side Plank (Left)", duration: 30, image: "side_plank_left"),
    Exercise(name: "Side Plank (Right)", duration: 30, image: "side_plank_right"),
    Exercise(name: "Wall Sit", duration: 60, image: "wall_sit"),
    Exercise(name: "Superman", duration: 30, image: "superman"),
    Exercise(name: "Tricep Dips", duration: 30, image: "tricep_dips"),
    Exercise(name: "Leg Raises", duration: 30, image: "leg_raises"),
    Exercise(name: "Flutter Kicks", duration: 30, image: "flutter_kicks"),
    Exercise(name: "Calf Raises", duration: 30, image: "calf_raises"),
    Exercise(name: "Reverse Crunches", duration: 30, image: "reverse_crunches"),
    Exercise(name: "Bear Crawl", duration: 45, image: "bear_crawl"),
    Exercise(name: "Skater Jumps", duration: 45, image: "skater_jumps"),
    Exercise(name: "Plank to Push-up", duration: 45, image: "plank_to_push_up")
]

