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
                .padding()
                .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.2)))
                .foregroundStyle(.lighterGray)
                .tint(.royalPurple)
            
        }
        
    }
}
