import SwiftUI

struct WorkoutDetailView: View {
    var body: some View {
        ScrollView {
            Image("image")
                .resizable()
                .frame(width: .infinity ,height: 500)
                .aspectRatio(contentMode: .fill)
            
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
                
            }
            .padding(.horizontal, 10)
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    WorkoutDetailView()
}
