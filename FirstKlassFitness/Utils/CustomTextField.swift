//
//  CustonTextField.swift
//  FirstKlassFitness
//
//  Created by Alandis Seals on 6/7/24.
//

import SwiftUI

struct CustomTextField: View {
    var textFieldTitle: String
    @Binding var name: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(textFieldTitle)
                .font(.custom("Oswald-SemiBold", size: 18))
                .font(.title)
                .foregroundStyle(.lighterGray)
           
            VStack(spacing: 0) {
                TextField("", text: $name)
                    .font(.headline)
                    .foregroundStyle(.lavender)
                    .frame(height: 45)
                    .padding(.horizontal)
                
                RoundedRectangle(cornerRadius: 5)
                    .frame(height: 2)
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 10)
            }
        }
       
    }
}

struct OnBoardingTextField: View {
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            TextField("", text: $text)
                .font(.headline)
                .foregroundStyle(.lavender)
                .frame(height: 55)
                .padding(.horizontal)
                .background(Color(.white))
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            if text.isEmpty {
                           Text(placeholder)
                                .foregroundColor(.charcoalGray)
                               .padding(.leading, 10)
                       }
        }
    }
}
