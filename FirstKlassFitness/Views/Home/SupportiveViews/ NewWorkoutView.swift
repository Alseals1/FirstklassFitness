import SwiftUI

struct NewWorkoutView: View {
    var body: some View {
        VStack {
            HStack {
                Text("New Workouts")
                    .foregroundStyle(.white)
                    .font(.system(size: 16))
                
                Spacer()
            }
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(1..<10) { card in
                            WorkoutLGCardView()
                    }
                }
            }
        }
        .padding(.top, 20)
    }
}

#Preview {
    NewWorkoutView()
}
