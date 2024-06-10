//
//  DotView.swift
//  FirstKlassFitness
//
//  Created by Alandis Seals on 6/9/24.
//

import SwiftUI

struct DotView: View {
    let index: Int
    @Binding var currentPage: Int
    
    var body: some View {
            Circle()
                .fill(checkCurrentPage())
                .frame(width: 8, height: 8)
    }
    
    func checkCurrentPage() -> Color {
        if index == currentPage {
            return .royalPurple
        }
        return .royalPurple.opacity(0.20)
    }
}

#Preview {
    Group {
        DotView(index: 0, currentPage: .constant(0))
        DotView(index: 1, currentPage: .constant(0))
    }
}
