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
                    VStack {
                        Text("Goal")
                            .font(.custom("Oswald-Bold", size: 10))
                        Text("\(Int(currentUserCalorieGoal ?? 0))")
                    }
                    .font(.caption)
                    .padding()
                    .background(Circle().fill(Gradient(colors: [.lavender, .royalPurple])))
                    
                    HStack {
                        Text("\(Int(calories))")
                            .font(.custom("Oswald-Regular", size: 36))
                        Text("Cal")
                            .font(.custom("Oswald-Regular", size: 24))
                    }
                    Text("Active Calories")
                        .font(.custom("Oswald-Regular", size: 13))
                    
                    if Int(currentUserCalorieGoal ?? 0) < calories  {
                        Text("You are over your goal\n calories for today")
                            .foregroundColor(.red)
                            .font(.custom("Oswald-Bold", size: 14))
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


