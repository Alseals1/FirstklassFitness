import SwiftUI
import SwiftData

struct MealLogStationView: View {
    @Environment(\.modelContext) var modelContext
    @State private var mealTextField: String = ""
    @State private var caloriesTextField: String = ""
    @State private var logDate: Date = .now
    @Binding var mealLogShown: Bool
    @Binding var selectedDate: Date
    @State private var animateIcon = false
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                Text("Log Station")
                    .foregroundStyle(.white)
                    .bold()
                
                VStack {
                    Text("Swipe down to exit")
                    VStack {
                        Image(systemName: "chevron.down")
                            .foregroundColor(.white)
                            .font(.system(size: 24))
                            .padding(.top, 2)
                            .offset(y: animateIcon ? 10 : -10)
                            .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true), value: animateIcon)
                            .onAppear {
                                animateIcon = true
                            }
                        Image(systemName: "chevron.down")
                            .foregroundColor(.white)
                            .font(.system(size: 24))
                            .padding(.top, 2)
                            .offset(y: animateIcon ? 10 : -10)
                            .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true), value: animateIcon)
                            .onAppear {
                                animateIcon = true
                            }
                    }
                }
                .padding(.top, 5)
                
                mealEntryView
                
                if !mealTextField.isEmpty {
                    Button(action: {
                        mealLogShown = false
                        addMeal()
                    }, label: {
                        Text("Add Meal")
                            .padding([.horizontal, .vertical], 8)
                            .foregroundStyle(.white)
                            .background(.lavender)
                            .cornerRadius(10)
                    })
                    .padding()
                    .buttonStyle(.plain)
                }
            }
        }
        
    }
    
    var mealEntryView: some View {
        VStack(spacing: 30) {
            VStack(alignment: .leading) {
                Text("Meal")
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                
                TextField("", text: $mealTextField)
                    .padding()
                    .foregroundStyle(.white)
                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                    .placeholder(when: mealTextField.isEmpty) {
                        Text("Log Your Meal").foregroundColor(.gray)
                            .padding(.horizontal)
                    }
            }
            
            VStack(alignment: .leading) {
                Text("Calories")
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                
                TextField("", text: $caloriesTextField)
                    .padding()
                    .foregroundStyle(.white)
                    .background(RoundedRectangle(cornerRadius: 10)
                        .fill(.gray.opacity(0.1)))
                    .placeholder(when: mealTextField.isEmpty) {
                        Text("Log Your Calories").foregroundColor(.gray)
                            .padding(.horizontal)
                    }
            }
        }
        .padding(.horizontal, 20)
    }
}

extension MealLogStationView {
    func addMeal() {
        let calories = self.caloriesTextField
        let meal = self.mealTextField
        let date = selectedDate
        let newMeal = Meal(calories: Int(calories) ?? 0, meal: meal, date: date)
        
        modelContext.insert(newMeal)
    }
}

#Preview {
    MealLogStationView(mealLogShown: .constant(false), selectedDate: .constant(.now))
}
