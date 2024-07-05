import SwiftUI

struct WorkoutCategoriesSectionView: View {
   @State private var exercises: [Exercise] = []
    @State private var currentTab: Difficulty = .beginner
    var tabs: [Difficulty] = [.beginner, .intermediate, .advanced]
    
    var body: some View {
        VStack {
            HStack {
                Text("Workout Categories")
                    .font(.custom("Oswald-bold", size: 14))
                    .foregroundStyle(.white)
                    
                
                Spacer()

                NavigationLink {
                    AllExerciseView(exercises: exercises)
                } label: {
                    Text("See All")
                        .font(.custom("Oswald-Bold", size: 14))

                        .foregroundStyle(.lavender)
                }
            }
            
            category
            
           workouts
        }
        .onAppear {
            ExerciseManager.loadExercises { loadedExercise in
                self.exercises = loadedExercise
            }
        }
    }
  
}

#Preview {
    NavigationStack {
        ZStack {
            Color.black
                .ignoresSafeArea()
            WorkoutCategoriesSectionView()
        }
    }
    .preferredColorScheme(.dark)
}

extension WorkoutCategoriesSectionView {
    var workouts: some View {
        ScrollView {
            LazyVStack(spacing: 30) {
                ForEach(filteredExercises) { card in
                    NavigationLink(
                        destination: WorkoutDetailView(exercise: card),
                        label: {
                            WorkoutLGCardView(exercise: card)
                        })
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned)
        .safeAreaPadding(.horizontal, 5)
    }
    
    var category: some View {
        HStack {
            HStack {
                ForEach(tabs, id: \.rawValue) { tab in
                    Button(action: {
                        currentTab = tab
                    }, label: {
                        Text(tab.rawValue)
                            .fontWeight(.medium)
                            .padding(.vertical, 7)
                            .padding(.horizontal, 10)
                    })
                    .background(
                        RoundedRectangle(cornerRadius: 32)
                            .fill(currentTab == tab ? .lavender : .charcoalGray)
                    )
                    .frame(maxWidth: .infinity)
                }
            }
            .foregroundStyle(.white)
            .buttonStyle(.plain)
        }
        .frame(maxWidth: .infinity)
    }
    
    var filteredExercises: [Exercise] {
        exercises.filter { $0.levelofExercise == currentTab.rawValue }
       }
}
