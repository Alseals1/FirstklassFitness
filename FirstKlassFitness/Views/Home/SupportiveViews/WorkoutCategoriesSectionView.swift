//
//  WorkoutCategoriesSectionView.swift
//  FirstKlassFitness
//
//  Created by Alandis Seals on 1/16/24.
//

import SwiftUI

struct WorkoutCategoriesSectionView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Workout Categories")
                    .foregroundStyle(.white)
                
                Spacer()
                
                Button(action: {}, label: {
                    Text("See All")
                        .foregroundStyle(.lavender)
                })
                .buttonStyle(.plain)
            }
           category
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(1..<10) { card in
                            WorkoutLGCardView()
                    }
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
            .safeAreaPadding(.horizontal, 5)
            
        }
    }
    
    var category: some View {
        HStack {
                HStack {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Beginner")
                            .padding(.vertical, 7)
                            .padding(.horizontal, 10)
                    })
                    .background(.lavender)
                    .clipShape(Capsule())
                    
                    
                    
                    Spacer()
                    
                    Button(action: {}
                           , label: {
                        Text("Intermediate")
                            .padding(.vertical, 7)
                            .padding(.horizontal, 10)
                    })
                    
                    Spacer()
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Advanced")
                            .padding(.vertical, 7)
                            .padding(.horizontal, 10)
                    })
                    
                }
                .foregroundStyle(.white)
                .buttonStyle(.plain)
                
            
        }
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 32)
            .fill(.charcoalGray)
        )
    }
}

#Preview {
    ZStack {
        Color.black
            .ignoresSafeArea()
        
        WorkoutCategoriesSectionView()
    }
}
