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
        VStack(alignment: .leading) {
            Text(textFieldTitle)
                .font(.title)
                .foregroundStyle(.lighterGray)
            TextField("", text: $name)
                .font(.headline)
                .foregroundStyle(.lavender)
                .frame(height: 55)
                .padding(.horizontal)
                .background(Color(.charcoalGray))
                .clipShape(RoundedRectangle(cornerRadius: 8))
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
