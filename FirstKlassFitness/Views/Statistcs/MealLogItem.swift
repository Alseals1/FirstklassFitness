//
//  MealLogItem.swift
//  FirstKlassFitness
//
//  Created by Alandis Seals on 2/4/24.
//

import SwiftUI

struct MealLogItem: View {
    var calories: Int
    var meal: String
    var date: Date
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text(meal)
                        .font(.custom("Oswald-SemiBold", size: 17))
                        .foregroundStyle(.lighterGray)
                    Spacer()
                    Text(date.formattedTime())
                        .font(.custom("Oswald-Regular", size: 13))
                        .foregroundStyle(.lavender)
                }
                HStack(spacing: 4) {
                    Text("Calories:")
                        .font(.custom("Oswald-SemiBold", size: 17))
                    .foregroundStyle(.lighterGray)
                    
                    Text("\(calories)")
                        .font(.custom("Oswald-SemiBold", size: 17))
                        .foregroundStyle(.lavender)
                }
            }
            .padding()
        }
        .frame(height: 76)
    }
}



#Preview {
    MealLogItem(calories: 300, meal: "Chicken", date: .now)
}
