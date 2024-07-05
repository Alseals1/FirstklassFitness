import SwiftUI

struct HomeView: View {
    @AppStorage("name") var currentUserName: String?
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                HStack {
                    Text("Hello \(currentUserName ?? "No Name"),")
                        .font(.custom("Oswald-Bold", size: 34))
                        .foregroundStyle(Color.white)
                    Spacer()
                }
                .padding([.top, .horizontal])
                TodayWorkoutPlanView()
                WorkoutCategoriesSectionView()
            }
            .padding(.horizontal, 5)
        }
        .scrollIndicators(.never)
    }
}

#Preview {
    ZStack {
        Color.black
            .ignoresSafeArea()
        
        HomeView()
    }
}
