import SwiftUI

struct TodayWorkoutPlanView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Check Out These Workouts")
                    .foregroundStyle(.white)
                    .font(.system(size: 16))
                    .bold()
                
                Spacer()
                
                Text("Mon 26 January")
                    .foregroundStyle(.lavender)
                    .font(.system(size: 16))
                
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(1..<10, id: \.self) { _ in
                     
                        NavigationLink(
                            destination: WorkoutDetailView(),
                            label: {
                                selectedWorkoutView
                            })
                        .containerRelativeFrame(.horizontal, count: 3, spacing: 10)
                        .scrollTransition { content, phase in
                            content
                                .opacity(phase.isIdentity ? 1.0 : 0.2)
                                .scaleEffect(phase.isIdentity ? 1.0 : 0.2)
                                
                        }
                    }
                }
                .scrollTargetLayout()
            }
            .contentMargins(10, for: .scrollContent)
            .scrollTargetBehavior(.viewAligned)
        }
        .padding(.top, 20)
    }
}

var selectedWorkoutView: some View {
    ZStack(alignment: .bottomLeading) {
        Image("image3")
            .resizable()
            .aspectRatio(contentMode: .fit)

    }
    .clipShape(Circle())
}

#Preview {
    ZStack {
        Color.black
            .ignoresSafeArea()
        TodayWorkoutPlanView()
    }
}
