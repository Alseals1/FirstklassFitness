import SwiftUI

struct TodayWorkoutPlanView: View {
    @State private var exercises: [Exercise] = []
    #warning("Add Images to Data")
    #warning("Add SwiftData")
    
    var body: some View {
        VStack {
            HStack {
                Text("Check Out These Workouts")
                    .foregroundStyle(.white)
                    .font(.system(size: 16))
                    .bold()
                
                Spacer()
                
                Text(Date().formattedDate())
                    .foregroundStyle(.lavender)
                    .font(.system(size: 16))
                
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(exercises ) { exercise in
                     
                        NavigationLink(
                            destination: WorkoutDetailView(exercise: exercise),
                            label: {
                                ZStack(alignment: .bottomLeading) {
                                    Image(exercise.workoutImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                }
                                .clipShape(Circle())
                            })
                        .containerRelativeFrame(.horizontal, count: 3, spacing: 10)
                        .scrollTransition { content, phase in
                            content
                                .opacity(phase.isIdentity ? 1.0 : 0.2)
                                .scaleEffect(phase.isIdentity ? 1.0 : 0.2)
                        }
                    }
                }
                .scrollTargetLayout()
            }
            .contentMargins(10, for: .scrollContent)
            .scrollTargetBehavior(.viewAligned)
        }
        .padding(.top, 20)
        .onAppear {
            ExerciseManager.loadExercises { loadedExercise in
                self.exercises = loadedExercise
            }
        }
    }
}

#Preview {
    ZStack {
        Color.black
            .ignoresSafeArea()
        TodayWorkoutPlanView()
    }
}
