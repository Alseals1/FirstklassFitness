import SwiftUI

struct WorkoutLGCardView: View {
    var exercise: Exercise
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(exercise.workoutImage)
                .resizable()
                .aspectRatio(contentMode: .fit)

            VStack(alignment: .leading, spacing: 0) {
                Text(exercise.name)
                    .foregroundStyle(.white)
                    .font(.system(size: 25, weight: .bold))
                
                HStack(spacing: 0) {
                    Text("\(exercise.duration)")
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
