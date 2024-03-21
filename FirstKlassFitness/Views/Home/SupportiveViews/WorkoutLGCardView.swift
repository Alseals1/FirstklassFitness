import SwiftUI

struct WorkoutLGCardView: View {
    var exercise: Exercise
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image("workoutImage")
                .resizable()
                .aspectRatio(contentMode: .fit)

            VStack(alignment: .trailing) {
                Text("Pushups")
                    .foregroundStyle(.white)
                    .font(.system(size: 25, weight: .bold))
                
                HStack(spacing: 1) {
                    Text("30")
                        .foregroundStyle(.white)
                    .fontWeight(.bold)
                    
                    Text("sec")
                        .foregroundStyle(.white)
                }
            }
            .padding([.leading, .bottom], 20)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.ultraThinMaterial.opacity(0.9))
            
           
        }
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

#Preview {
    WorkoutLGCardView(exercise: mockExercise)
}
