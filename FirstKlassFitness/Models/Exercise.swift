import Foundation

enum Difficulty: String {
    case beginner = "Beginner"
    case intermediate = "Intermediate"
    case advanced = "Advanced"
}
// Define a struct to represent a single exercise
struct Exercise: Identifiable, Decodable {
    var id: String
    var name: String
    var description: String
    var workoutDetailImage: String
    var duration: Int
    var levelofExercise: String
    var workoutImage: String
}

let mockExercise: Exercise = Exercise(
    id: UUID().uuidString
    , name: "Burpees",
    description: "Begin standing, drop into a squat position, kick feet back into a plank position, perform a push-up, return feet to the squat position, and then jump up explosively.",
    workoutDetailImage: "burpees_detail",
    duration: 45,
    levelofExercise: "Intermediate",
    workoutImage: "burpees_home"
)

let mockExercises: [Exercise] = [
    Exercise(
        id: UUID().uuidString,
        name: "Burpees",
        description: "Begin standing, drop into a squat position, kick feet back into a plank position, perform a push-up, return feet to the squat position, and then jump up explosively.",
        workoutDetailImage: "burpees_detail",
        duration: 45,
        levelofExercise: "Intermediate",
        workoutImage: "burpees_home"
    ),
    
    Exercise(
        id: UUID().uuidString,
        name: "Mountain Climbers",
        description: "Start in a plank position, alternate bringing knees towards the chest as if climbing a mountain, keeping hips low and core engaged.",
        workoutDetailImage: "mountain_climbers_detail",
        duration: 40,
        levelofExercise: "Intermediate",
        workoutImage: "mountain_climbers_home"
    ),
    
    Exercise(
        id: UUID().uuidString,
        name: "High Knees",
        description: "Stand with feet hip-width apart, run in place bringing knees up towards chest as high as possible while pumping arms.",
        workoutDetailImage: "high_knees_detail",
        duration: 30,
        levelofExercise: "Beginner",
        workoutImage: "high_knees_home"
    ),
    
    Exercise(
        id: UUID().uuidString,
        name: "Jumping Lunges",
        description: "Start in a lunge position, jump explosively into the air, switch legs in mid-air, and land in a lunge position with the opposite leg forward.",
        workoutDetailImage: "jumping_lunges_detail",
        duration: 40,
        levelofExercise: "Advanced",
        workoutImage: "jumping_lunges_home"
    )
]

