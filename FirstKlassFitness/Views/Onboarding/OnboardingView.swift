import SwiftUI

struct OnboardingView: View {
    @State var onboardingState: Int = 0
    let transition: AnyTransition = .asymmetric(insertion: .move(edge: .top), removal: .move(edge: .bottom))
    //Calorie Goal
    //Onboarding inputs
    @State var name: String = ""
    @State var age: Double = 50
    @State var gender: String = "Hello"
    
    //Onboarding alerts
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    //App Storage
    @AppStorage("name") var currentUserName: String?
    @AppStorage("age") var currentUserAge: Int?
    @AppStorage("gender") var currentUserGender: String?
#warning("Fix This Calorie Goal Part")
    @AppStorage("calorieGoal") var calorieGoal: Int?
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    
    
    var body: some View {
        ZStack {
            //content
            ZStack {
                switch onboardingState {
                case 0:
                  welcomeSection
                        .transition(transition)
                case 1:
                    addNameSection
                        .transition(transition)
                case 2:
                    addAgeSection
                        .transition(transition)
                case 3:
                    genderSection
                        .transition(transition)
                    
                default:
                    Text("WIFI Looks Down")
                }
            }
            
            //Button
            VStack {
                Spacer()
               bottomButton
            }
            .padding(30)
        }
        .alert(isPresented: $showAlert, content: {
            return Alert(title: Text(alertTitle))
        })
    }
}

#Preview {
    OnboardingView()
        .background(.charcoalGray)
}

// MARK: Views
extension OnboardingView {
    private var bottomButton: some View {
        Text(onboardingState == 0 ? "SIGN UP" : onboardingState == 3 ? "FINISHED" :
        "Next")
            .font(.headline)
            .foregroundStyle(.charcoalGray)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .onTapGesture {
                handleNextButtonPressed()
                
            }
    }
    
    private var welcomeSection: some View {
        VStack(spacing: 20) {
            Spacer()
            Image("transHIIT")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .foregroundStyle(.white)
            
            Text("Welcome to Your FirstKlass Fitness Journey!")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .overlay(alignment: .bottom) {
                    Capsule(style: .continuous)
                        .frame(height: 3)
                        .offset(y: 5)
                        .foregroundStyle(.white)
                }
            
            Text("Get ready to transform your fitness with high-intensity interval training. Let's start this journey together!")
                .fontWeight(.medium)
                .foregroundStyle(.white)
            Spacer()
            
        }
        .multilineTextAlignment(.center)
        .padding(30)
    }
    
    private var addNameSection: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Text("What Your Name?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
            
            TextField("Your name here...", text: $name)
                .font(.headline)
                .foregroundStyle(.lavender)
                .frame(height: 55)
                .padding(.horizontal)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
           
            Spacer()
            Spacer()
        }
      
        .padding(30)
    }
    
    private var addAgeSection: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Text("What Your Age?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
           
            
            Text("\( String(format: "%.0f", age))")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.lavender)
            
            Slider(value: $age, in: 18...100, step: 1)
                .accentColor(.lavender)
           
            Spacer()
            Spacer()
        }
      
        .padding(30)
    }
    
    private var genderSection: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Text("What's your gender?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                
            Picker(selection: $gender, content: {
                Text("Male").tag(1)
                Text("Female").tag(2)
                Text("Don't Know").tag(3)
            }, label: {
                Text("Select a gender")
            })
            .pickerStyle(.wheel)

            Spacer()
            Spacer()
            
        }
        .multilineTextAlignment(.center)
        .padding(30)
    }
    
}

// MARK: FUNCTIONS
extension OnboardingView {
    func handleNextButtonPressed() {
        //check inputs
        switch onboardingState {
        case 1:
            guard name.count >= 3 else {
                showAlert(title: "Your name must be at least 3 character long! 🫠")
                return
            }
        case 3:
            guard gender.count > 1 else {
                showAlert(title: "Please Select a gender before moving foreward! 🥶")
                return
            }
        default:
            break
        }
        
        //go to next section
        if onboardingState == 3 {
            signedIn()
            //sign in
        } else {
            withAnimation(.spring) {
                onboardingState += 1
            }
        }
    }
    
    func signedIn() {
        currentUserName = name
        currentUserAge = Int(age)
        currentUserGender = gender
        withAnimation(.bouncy()) {
            currentUserSignedIn = true
        }
       
    }
    
    func showAlert(title: String) {
        alertTitle = title
        showAlert.toggle()
    }
    
}

