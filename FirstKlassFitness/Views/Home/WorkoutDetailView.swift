import SwiftUI

struct WorkoutDetailView: View {
    var exercise: Exercise
    
    var body: some View {
        ScrollView {
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
                ZStack {
                    Image(exercise.workoutImage)
                        .resizable()
                        .frame(maxWidth: .infinity, maxHeight: 500 )
                    
                    Image("story-item-overlay")
                        .resizable()
                        .frame(maxWidth: .infinity)
                }
                
                Text(exercise.name)
                    .foregroundStyle(.white)
                    .font(.system(size: 33, weight: .bold))
                    .lineLimit(.max)
                    .padding([.bottom, .leading], 20)
            }
            .clipShape(RoundedRectangle(cornerRadius: 25))
            
            VStack(spacing: 10) {
                HStack {
                    Text("TIME:")
                        .padding(5)
                        .background(RoundedRectangle(cornerRadius: 8).fill(.lavender))
                    
                    Text("\(exercise.duration)sec")
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                Text(exercise.description)
                    .font(.system(size: 18, weight: .medium))
                    .multilineTextAlignment(.leading)
                
                NavigationLink {
                    NotesView()
                } label: {
                    VStack {
                        Text("Notes")
                            .font(.system(size: 20))
                            .bold()
                        
                        Image(systemName: "square.and.pencil")
                            .font(.system(size: 30, weight: .medium))
                            .foregroundStyle(.lighterGray)
                    }
                    .foregroundStyle(.white)
                }
                .frame(maxWidth: .infinity ,alignment: .trailing)
            }
            .padding(.horizontal, 10)
        }
        .ignoresSafeArea(.container, edges: .top)
    }
}

#Preview {
    NavigationStack {
        WorkoutDetailView(exercise: mockExercise)
    }
}
