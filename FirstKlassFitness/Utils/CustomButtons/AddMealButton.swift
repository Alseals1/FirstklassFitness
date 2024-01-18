import SwiftUI

struct AddMealButton: View {
    let action: () -> Void
    let image: String
    let imageColor: Color
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            ZStack {
                Circle()
                    .stroke()
                    .fill(imageColor)
                    .frame(height: 25)
                Image(systemName: image)
                    .padding()
                    .foregroundColor(.white)
                    .frame(height: 20)
            }
        })
    }
}

#Preview {
    AddMealButton(action: {}, image: "", imageColor: .lavender)
}
