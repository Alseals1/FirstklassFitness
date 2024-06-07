import SwiftUI


struct ProgressInformationView: View {
    @AppStorage("calorieGoal") var currentUserCalorieGoal: Double?
    
    var calories: Int
    
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(lineWidth: 8)
                    .fill(Gradient(colors: [.royalPurple, .lavender]).opacity(0.5))
                
                Circle()
                    .trim(from: 0, to: Double(calories) / (currentUserCalorieGoal ?? 0))
                    .stroke(lineWidth: 8)
                    .fill(calories <= Int(currentUserCalorieGoal ?? 0) ? Gradient(colors: [.royalPurple, .lavender]) : Gradient(colors: [.red, .red.opacity(0.5)]))
                    .rotationEffect(.degrees(-90))
                
                VStack(spacing: 5){
                    HStack {
                        Text("\(Int(currentUserCalorieGoal ?? 0))")
                            .font(.system(size: 36))
                        Text("Cal")
                            .font(.system(size: 24))
                    }
                    Text("Active Calories")
                        .font(.system(size: 13))
                    
                    if Int(currentUserCalorieGoal ?? 0) < calories  {
                        Text("You are over your goal\n calories for today")
                            .foregroundColor(.red)
                            .font(.system(size: 15, weight: .semibold))
                            .multilineTextAlignment(.center)
                    }
                }
                .foregroundColor(.white)
            }
        }
        .frame(width: 300)
    }
}

#Preview {
    ProgressInformationView(calories: 1000)
}


