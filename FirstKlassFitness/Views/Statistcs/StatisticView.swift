import SwiftUI

struct StatisticView: View {
    @State private var mealLogShown = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                VStack {
                    MonthView()
                        .padding(.vertical)
                    
                    ProgressInformationView(calories: 1000, goalCalories: 3000)
                        .padding(15)
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Meal Log")
                                .foregroundColor(.lavender)
                                .font(.system(size: 20))
                            
                            Spacer()
                            
                            AddMealButton(action: {
                                #warning("Need Action")
                            }, image: "plus", imageColor: .lavender)
                        }
                    }
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    StatisticView()
}
