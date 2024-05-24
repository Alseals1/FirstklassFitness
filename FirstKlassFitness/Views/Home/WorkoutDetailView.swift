import SwiftUI

struct WorkoutDetailView: View {
    var exercise: Exercise
    @State private var notesLogShown: Bool = false
    
    var body: some View {
        ScrollView {
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
                ZStack {
                    Color.black
                    
                    Blur(style: .dark)
                        .frame(maxWidth: .infinity)
                    
                    Image(exercise.workoutImage)
                        .resizable()
                        .mask(
                            LinearGradient(gradient: Gradient(stops: [.init(color: .black, location: 0),
                                                                      .init(color: .black.opacity(0.5), location: 0.7),
                                                                      .init(color: .black.opacity(0), location: 1.0)]),
                                           startPoint: .top,
                                           endPoint: .bottom)
                        )
                       
                }
                .frame(maxWidth: .infinity, maxHeight: 500 )
               
                
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
                
                Button(action: {
                    notesLogShown.toggle()
                }, label: {
                    VStack {
                        Text("Notes")
                            .font(.system(size: 20))
                            .bold()
                        
                        Image(systemName: "square.and.pencil")
                            .font(.system(size: 30, weight: .medium))
                            .foregroundStyle(.lighterGray)
                    }
                    .foregroundStyle(.white)
                })
                .frame(maxWidth: .infinity ,alignment: .trailing)
                .popover(isPresented: $notesLogShown) {
                    NotesLogView(isNotesView: .constant(true))
                        .presentationDetents([.medium])
                }
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
