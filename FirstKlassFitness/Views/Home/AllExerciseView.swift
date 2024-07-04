import SwiftUI

struct AllExerciseView: View {
    @State var exercises: [Exercise]
    
    var body: some View {
        Form {
            ForEach(exercises) { exercise in
                NavigationLink {
                    WorkoutDetailView(exercise: exercise)
                } label: {
                    Text(exercise.name)
                        .foregroundStyle(.white)
                }

                
            }
        }
        .onAppear {
            ExerciseManager.loadExercises { loadedExercise in
                self.exercises = loadedExercise
            }
        }
    }
}
