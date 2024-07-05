import SwiftUI

struct TodayWorkoutPlanView: View {
    @State private var exercises: [Exercise] = []
    #warning("Add Images to Data")
    
    var body: some View {
        VStack {
            HStack {
                Text("Check Out These Workouts")
                    .font(.custom("Oswald-Bold", size: 14))
                    .foregroundStyle(.white)
                
                Spacer()
                
                Text(Date().formattedDate())
                    .foregroundStyle(.lavender)
                    .font(.custom("Oswald-Regular", size: 15))
                
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(exercises) { exercise in
                     
                        NavigationLink(
                            destination: WorkoutDetailView(exercise: exercise),
                            label: {
                                ZStack(alignment: .bottomLeading) {
                                    Image(exercise.workoutImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                    Circle()
                                        .stroke(.lavender, lineWidth: 3)
                                        
                                    
                                   
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
