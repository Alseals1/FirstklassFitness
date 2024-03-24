import SwiftUI


struct ProgressInformationView: View {
    var calories: Int
    var goalCalories: Int
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(lineWidth: 8)
                    .fill(Gradient(colors: [.royalPurple, .lavender]).opacity(0.5))
                
                Circle()
                    .trim(from: 0, to: Double(calories) / Double(goalCalories))
                    .stroke(lineWidth: 8)
                    .fill(calories <= goalCalories ? Gradient(colors: [.royalPurple, .lavender]) : Gradient(colors: [.red, .red.opacity(0.5)]))
                    .rotationEffect(.degrees(-90))
                
                VStack(spacing: 5){
                    HStack {
                        Text("\(calories)")
                            .font(.system(size: 36))
                        Text("Cal")
                            .font(.system(size: 24))
                    }
                    Text("Active Calories")
                        .font(.system(size: 13))
                    
                    if goalCalories < calories  {
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
    ProgressInformationView(calories: 1000, goalCalories: 3000)
}
