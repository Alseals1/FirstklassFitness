import SwiftUI
enum Difficulty: String {
    case beginner = "Beginner"
    case intermediate = "Intermediate"
    case advanced = "Advanced"
}
struct WorkoutCategoriesSectionView: View {
   var tabs: [Difficulty] = [.beginner, .intermediate, .advanced]
    @State private var currentTab: Difficulty = .beginner
    
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
            
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(1..<10) { card in
                        NavigationLink(
                            destination: WorkoutDetailView(),
                            label: {
                                WorkoutLGCardView()
                            })
                    }
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
            .safeAreaPadding(.horizontal, 5)
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
}

#Preview {
    ZStack {
        Color.black
            .ignoresSafeArea()
        WorkoutCategoriesSectionView()
    }
}
