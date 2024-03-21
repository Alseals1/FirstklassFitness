import SwiftUI

struct WorkoutDetailView: View {
    
    var body: some View {
        ScrollView {
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
                ZStack {
                    Image("workoutImage")
                        .resizable()
                        .frame(maxWidth: .infinity, maxHeight: 500 )
                    
                    Image("story-item-overlay")
                        .resizable()
                        .frame(maxWidth: .infinity)
                }
                
                
                Text("30 Minute Core Thrust")
                    .foregroundStyle(.white)
                    .font(.system(size: 33, weight: .bold))
                    .lineLimit(.max)
                    .padding([.bottom, .leading], 20)
            }
            .clipShape(RoundedRectangle(cornerRadius: 25))
            
            VStack(spacing: 10) {
                HStack {
                    Text("3 sets")
                        .padding(5)
                        .background(RoundedRectangle(cornerRadius: 8).fill(.lavender))
                    
                    
                    Text("45s")
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                Text("Est accusantium amet nam ipsam blanditiis ut voluptatibus dolorem. Eos obcaecati natus id perferendis quibusdam et explicabo omnis ab asperiores reprehenderit non libero dolore qui ullam dolorum et praesentium quia. Aut voluptatibus dignissimos et error sapiente hic ratione molestiae. Quo internos illo non quae sint nam nihil velit ex provident necessitatibus hic minima aliquam aut quas consectetur et quibusdam ratione.")
                    .font(.system(size: 18, weight: .medium))
                    .multilineTextAlignment(.leading)
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "square.and.pencil")
                        .font(.system(size: 30, weight: .medium))
                        .foregroundStyle(.lighterGray)
                })
                .frame(maxWidth: .infinity ,alignment: .trailing)
                
                
            }
            .padding(.horizontal, 10)
            
        }
        .ignoresSafeArea(.container, edges: .top)
    }
}

#Preview {
    WorkoutDetailView()
}
