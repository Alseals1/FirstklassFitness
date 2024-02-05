import SwiftUI

struct MealLogStationView: View {
    @State private var mealTextField: String = ""
    @State private var caloriesTextField: String = ""
    @State private var logDate: Date = .now
    @Binding var mealLogShown: Bool
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                Text("Log Station")
                    .foregroundStyle(.white)
                    .bold()
                
                mealEntryView
                
                if !mealTextField.isEmpty {
                    Button(action: {
                        demo.append(Meal(calories: Int(caloriesTextField) ?? 0, meal: mealTextField, date: .now))
                        mealLogShown = false
                        
                        print(demo)
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

#Preview {
    MealLogStationView(mealLogShown: .constant(false))
}
