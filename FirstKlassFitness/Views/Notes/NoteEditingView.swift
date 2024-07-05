//
//  NoteEditingView.swift
//  FirstKlassFitness
//
//  Created by Alandis Seals on 7/4/24.
//

import SwiftUI
import SwiftData

struct NoteEditingView: View {
    @Environment(\.dismiss) var dismiss
    @Bindable var note: Notes
    
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 2)  {
                    updateNotesView
            }
        }
        .navigationTitle("Update Notes")
        .toolbar {
            ToolbarItemGroup(placement: .topBarTrailing) {
                Button(action: { dismiss() }) {
                    Image(systemName: "checkmark")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.white)
                        .padding(5)
                        .background(.lavender)
                        .clipShape(Circle())
                        .shadow(color: Color.gray.opacity(0.6), radius: 20, x: 0, y: 5)
                }
            }
        }
    }
    
    var updateNotesView: some View {
        VStack(spacing: 30) {
            VStack(alignment: .leading) {
                Text("Title")
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                
                TextField(note.title, text: $note.title)
                    .padding()
                    .foregroundStyle(.white)
                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                    .placeholder(when: note.title.isEmpty) {
                        Text("Naming Your Notes will help organization").foregroundColor(.gray)
                            .padding(.horizontal)
                    }
            }
            
            VStack(alignment: .leading) {
                Text("Description")
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                
                TextField(note.abstract, text: $note.abstract)
                    .padding()
                    .foregroundStyle(.white)
                    .background(RoundedRectangle(cornerRadius: 10)
                        .fill(.gray.opacity(0.1)))
                    .placeholder(when: note.abstract.isEmpty) {
                        Text("What would you like to note").foregroundColor(.gray)
                            .padding(.horizontal)
                    }
            }
            .padding(.top, 5)
        }
        .padding(.horizontal, 20)
    }
    
}

#Preview {
    NoteEditingView(note: Notes(title: "Nike", abstract: "Just Do It!!"))
}
