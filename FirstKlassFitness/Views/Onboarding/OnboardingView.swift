import SwiftUI

struct OnboardingView: View {
    @State var onboardingState: Int = 0
    let transition: AnyTransition = .asymmetric(insertion: .move(edge: .top), removal: .move(edge: .bottom))
    //Calorie Goal
    //Onboarding inputs
    @State var name: String = ""
    @State var age: Double = 50
    @State var gender: String = ""
    @State var height: String = ""
    @State var weight: String = ""
    
    //Onboarding alerts
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    //App Storage
    @AppStorage("name") var currentUserName: String?
    @AppStorage("age") var currentUserAge: Int?
    @AppStorage("gender") var currentUserGender: String?
#warning("Fix This Calorie Goal Part")
    @AppStorage("weight") var currentUserWeight: String?
    @AppStorage("height") var currentUserHeight: String?
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    @AppStorage("calorieGoal") var currentUserCalorieGoal: Double?
    
    @State private var bmi: Double?
    @State private var calorieGoal: Double?
    
    
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
                .font(.largeTitle)
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
        VStack(spacing: 0) {
            
            VStack(spacing: 3) {
                Text("Height")
                    .font(.headline)
                    .padding()
                
                TextField("H", text: $height)
                    .keyboardType(.decimalPad)
                    .font(.headline)
                    .foregroundStyle(.lavender)
                    .frame(height: 55)
                    .padding(.horizontal)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            VStack(spacing: 10) {
                Text("Weight")
                    .font(.headline)
                    .padding()
                
                
                TextField("W", text: $weight)
                    .keyboardType(.decimalPad)
                    .font(.headline)
                    .foregroundStyle(.lavender)
                    .frame(height: 55)
                    .padding(.horizontal)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
        .padding(.horizontal, 80)
    }
    
    private var bmiCaloriesSection: some View {
        VStack(spacing: 20) {
            Spacer()
            
            if let bmi = bmi, let calorieGoal = calorieGoal {
                Text("Your BMI: \(String(format: "%.2f", bmi))")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding()
                
                Text("Your Daily Calorie Goal: \(Int(calorieGoal)) kcal")
                    .font(.headline)
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
        print(currentUserCalorieGoal)
        
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
                showAlert(title: "To calculate you BMI and Calorie Goals properly we must have you weight and height")
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
