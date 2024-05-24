import SwiftUI

struct HomeView: View {
    #warning("Fix Setting")
    var body: some View {
            ScrollView {
                VStack(spacing: 20) {
                    HStack {
                        Text("Hello Alandis,")
                            .font(.system(size: 36))
                            .foregroundStyle(Color.white)
                            
                        Spacer()
                    }
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
