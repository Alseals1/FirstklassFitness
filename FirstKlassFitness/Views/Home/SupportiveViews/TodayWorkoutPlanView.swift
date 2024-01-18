import SwiftUI

struct TodayWorkoutPlanView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Today's Workout Plan")
                    .foregroundStyle(.white)
                    .font(.system(size: 16))
                
                Spacer()
                
                Text("Mon 26 January")
                    .foregroundStyle(.lavender)
                    .font(.system(size: 16))
                
            }
            
            WorkoutLGCardView()
        }
        .padding(.top, 20)
    }
}

#Preview {
    ZStack {
        Color.black
            .ignoresSafeArea()
        TodayWorkoutPlanView()
    }
}
