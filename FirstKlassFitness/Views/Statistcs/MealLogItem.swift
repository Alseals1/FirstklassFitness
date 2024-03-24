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
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundStyle(.lighterGray)
                    Spacer()
                    Text(date.formattedTime())
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundStyle(.lavender)
                }
                HStack(spacing: 4) {
                    Text("Calories:")
                        .font(.system(size: 17, weight: .semibold))
                    .foregroundStyle(.lighterGray)
                    
                    Text("\(calories)")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundStyle(.lavender)
                }
            }
            .padding()
        }
        .frame(height: 76)
        .background(RoundedRectangle(cornerRadius: 12)
            .fill(Color.charcoalGray))
    }
}



#Preview {
    MealLogItem(calories: 300, meal: "Chicken", date: .now)
}
