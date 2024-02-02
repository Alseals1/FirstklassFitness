import SwiftUI

struct WorkoutLGCardView: View {
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image("image1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 16))
           
            
            VStack {
                Text("Day 1 - Warm Up")
                    .foregroundStyle(.white)
                    .font(.custom("Roboto-Regular.ttf", size: 17))
                
                Text("07:00 - 08:00 AM")
                    .foregroundStyle(.lighterGray)
                    .font(.custom("Roboto-Regular.ttf", size: 13))
            }
            .padding([.leading, .bottom], 20)
        }
    }
}

#Preview {
    WorkoutLGCardView()
}
