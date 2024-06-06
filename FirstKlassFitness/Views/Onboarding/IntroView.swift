import SwiftUI

struct IntroView: View {
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [.black, .charcoalGray, .royalPurple, .black]), center: .topLeading, startRadius: 50, endRadius: UIScreen.main.bounds.height).ignoresSafeArea()
            
            if currentUserSignedIn  {
               ContentView()
                    .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top)))
            } else {
               OnboardingView()
                    .transition(.asymmetric(insertion: .move(edge: .top), removal: .move(edge: .bottom)))
                
            }
        }
    }
}

#Preview {
    IntroView()
}
