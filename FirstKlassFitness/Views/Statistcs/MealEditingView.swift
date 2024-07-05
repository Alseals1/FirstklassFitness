import SwiftUI

struct MealEditView: View {
    @Environment(\.dismiss) var dismiss
    @Bindable var meal: Meal
    
    var body: some View {
        VStack(spacing: 30) {
            VStack(alignment: .leading) {
                Text("Meal")
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                
                TextField(meal.meal, text: $meal.meal)
                    .padding()
                    .foregroundStyle(.white)
                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                    .placeholder(when: meal.meal.isEmpty) {
                        Text("Log Your Meal").foregroundColor(.gray)
                            .padding(.horizontal)
                    }
            }
            
            VStack(alignment: .leading) {
                Text("Calories")
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                
                TextField(meal.stringCal, text: bindingString(from: $meal.calories))
                    .padding()
                    .foregroundStyle(.white)
                    .background(RoundedRectangle(cornerRadius: 10)
                        .fill(.gray.opacity(0.1)))
                    .placeholder(when: meal.stringCal.isEmpty) {
                        Text("Log Your Calories").foregroundColor(.gray)
                            .padding(.horizontal)
                    }
            }
            
            Button(action: { dismiss() }, label: {
                Text("Done")
                    .foregroundStyle(.royalPurple)
                    
            })
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(.charcoalGray))
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    MealEditView(meal: Meal())
}

extension MealEditView {
    private func bindingString(from intBinding: Binding<Int>) -> Binding<String> {
         return Binding<String>(
             get: {
                 String(intBinding.wrappedValue)
             },
             set: {
                 if let intValue = Int($0) {
                     intBinding.wrappedValue = intValue
                 }
             }
         )
     }

}
