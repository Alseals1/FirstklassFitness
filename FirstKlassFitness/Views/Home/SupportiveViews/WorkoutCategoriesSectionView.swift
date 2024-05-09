import SwiftUI

struct WorkoutCategoriesSectionView: View {
    @State private var exercises: [Exercise] = []
    @State private var currentTab: Difficulty = .beginner
    var tabs: [Difficulty] = [.beginner, .intermediate, .advanced]
    
    var body: some View {
        VStack {
            HStack {
                Text("Workout Categories")
                    .foregroundStyle(.white)
                    .bold()
                
                Spacer()
                
                Button(action: {}, label: {
                    Text("See All")
                        .foregroundStyle(.lavender)
                })
                .buttonStyle(.plain)
            }
            
            category
            
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
        .onAppear {
            ExerciseManager.loadExercises { loadedExercise in
                self.exercises = loadedExercise
            }
        }
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

#Preview {
    ZStack {
        Color.black
            .ignoresSafeArea()
        WorkoutCategoriesSectionView()
    }
}
