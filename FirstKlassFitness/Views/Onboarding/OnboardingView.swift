import SwiftUI

struct OnboardingView: View {
    //App Storage
    @AppStorage("name") var currentUserName: String?
    @AppStorage("age") var currentUserAge: Int?
    @AppStorage("gender") var currentUserGender: String?
    @AppStorage("weight") var currentUserWeight: String?
    @AppStorage("height") var currentUserHeight: String?
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    @AppStorage("calorieGoal") var currentUserCalorieGoal: Double?
    
    @State var onboardingState: Int = 0
    let transition: AnyTransition = .asymmetric(insertion: .move(edge: .top), removal: .move(edge: .bottom))
    
    //Onboarding inputs
    @State var name: String = ""
    @State var age: Double = 50
    @State var gender: String = ""
    @State var height: String = ""
    @State var weight: String = ""
    
    @State private var bmi: Double?
    @State private var calorieGoal: Double?
    
    //Onboarding alerts
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    
    var body: some View {
        ZStack {
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
                case 4:
                    weightHeightSection
                        .transition(transition)
                case 5:
                    bmiCaloriesSection
                        .transition(transition)
                    
                default:
                    Text("WIFI Looks Down")
                }
            }
            
            //Button
            VStack {
                Spacer()
                navBar
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
    private var navBar: some View {
        HStack {
            HStack {
                ForEach(0..<5, id: \.self) { index in
                    DotView(index: index, currentPage: self.$onboardingState)
                }
            }
        }
    }
    
    private var bottomButton: some View {
        HStack {
            if onboardingState > 0 {
                Text("Back")
                .font(.headline)
                .foregroundStyle(.charcoalGray)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .onTapGesture {
                    withAnimation(.spring) {
                        onboardingState -= 1
                    }
                }
            }
            Text(onboardingState == 0 ? "SIGN UP" : onboardingState == 4 ? "Calculate" :
                    onboardingState == 5 ? "Finished" :
                            "Next")
            .font(.headline)
            .foregroundStyle(.charcoalGray)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .onTapGesture {
                onboardingState == 4 ? calculateBMIAndCalorieGoal() :  handleNextButtonPressed()
            }
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
                .font(.custom("Oswald-Bold", size: 24))
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .overlay(alignment: .bottom) {
                    Capsule(style: .continuous)
                        .frame(height: 3)
                        .offset(y: 5)
                        .foregroundStyle(.white)
                }
            
            Text("Get ready to transform your fitness with high-intensity interval training. Let's start this journey together!")//Roboto-Regular.ttf
                .font(.custom("Oswald-Regular", size: 18))
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
                .font(.custom("Oswald-Bold", size: 24))
                .fontWeight(.semibold)
                .foregroundStyle(.white)
            OnBoardingTextField(placeholder: "Your name here...", text: $name)
            
            Spacer()
            Spacer()
        }
        .padding(30)
    }
    
    private var addAgeSection: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Text("What Your Age?")
                .font(.custom("Oswald-Bold", size: 24))
                .fontWeight(.semibold)
                .foregroundStyle(.white)
            
            Text("\( String(format: "%.0f", age))")
                .font(.custom("Oswald-Bold", size: 24))
                .fontWeight(.semibold)
                .foregroundStyle(.lavender)
            
            Slider(value: $age, in: 4...100, step: 1)
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
                .font(.custom("Oswald-Bold", size: 24))
                .fontWeight(.semibold)
                .foregroundStyle(.white)
            
            Picker(selection: $gender, content: {
                Text("male").tag("male")
                Text("female").tag("female")
                Text("Don't Know").tag("male")
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
    
    private var weightHeightSection: some View {
        VStack(spacing: 10) {
            
            VStack() {
                VStack(spacing: 2) {
                    Text("Enter height in cm")
                        .font(.caption)
                }
                
                OnBoardingTextField(placeholder: "", text: $height)
                    .keyboardType(.numberPad)
                
            }
            VStack {
                VStack(spacing: 2) {
                    Text("Enter weight in lbs")
                        .font(.caption)
                }
                OnBoardingTextField(placeholder: "", text: $weight)
                    .keyboardType(.numberPad)
            }
        }
        .padding(.horizontal, 80)
    }
    
    private var bmiCaloriesSection: some View {
        VStack(spacing: 20) {
            Spacer()
            
            if let bmi = bmi, let calorieGoal = calorieGoal {
                Text("Your BMI: \(String(format: "%.2f", bmi))")
                    .font(.custom("Oswald-Bold", size: 20))
                    .foregroundStyle(.white)
                    .padding()
                
                Text("Your Daily Calorie Goal: \(Int(calorieGoal)) kcal")
                    .font(.custom("Oswald-Bold", size: 20))
                    .padding()
            }
            Spacer()
            Spacer()
        }
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
        if onboardingState == 5 {
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
        currentUserHeight = height
        currentUserWeight = weight
        currentUserCalorieGoal = calorieGoal
        
        withAnimation(.bouncy()) {
            currentUserSignedIn = true
        }
    }
    
    func showAlert(title: String) {
        alertTitle = title
        showAlert.toggle()
    }
    
    private func calculateBMIAndCalorieGoal() {
        let heightInMeters = (Double(height) ?? 0) / 100
        let weightInKg = Double(weight)
        let ageInYears = Double(age)
        
        // Calculate Calorie Goal (using Mifflin-St Jeor Equation for simplicity)
        let bmr: Double
        let gender = "male" // Assuming male for this example. Replace with actual user gender input if needed.
        
        bmi = (weightInKg ?? 0) / (heightInMeters * heightInMeters)
           
           // Calculate BMR
           let heightComponent = 6.25 * (heightInMeters * 100)
        let weightComponent = 10 * (weightInKg ?? 0)
           let ageComponent = 5 * ageInYears
           let genderComponent: Double
           
           if gender == "male" {
               genderComponent = 5
           } else {
               genderComponent = -161
           }
           
        bmr = weightComponent + heightComponent - ageComponent + genderComponent
        
        // Assuming a sedentary activity level for this example. Adjust as needed.
        calorieGoal = bmr * 1.2
        
        switch onboardingState {
        case 4:
            guard height.count > 1 && weight.count > 1 else {
                showAlert(title: "To calculate you BMI and Calorie Goals properly we must have your weight and height")
                return
            }
            
        default:
            break
        }
        
        withAnimation(.spring) {
            onboardingState += 1
        }
    }
}
