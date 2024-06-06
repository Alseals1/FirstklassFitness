import SwiftUI

struct HomeView: View {
    @AppStorage("name") var currentUserName: String?
    
    /// This is for testing pupose, you can delete when done
    @AppStorage("age") var currentUserAge: Int?
    @AppStorage("gender") var currentUserGender: String?
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                HStack {
                    Text("Hello \(currentUserName ?? "No Name"),")
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

extension HomeView {
    
    func signOut() {
        currentUserName = nil
        currentUserAge = nil
        currentUserGender = nil
        
        withAnimation(.spring()) {
            currentUserSignedIn = false
        }
    }
}
