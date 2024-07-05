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
                        .font(.custom("Oswald-Regular", size: 18))
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
