import SwiftUI

struct NotesLogView: View {
   
        @State private var noteTitle: String = ""
        @State private var notesAbstract: String = ""
        @State private var isNoteSheetShown: Bool = false
       
        
        var body: some View {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                VStack {
                    Text("Log Station")
                        .foregroundStyle(.white)
                        .bold()
                    
                    VStack(alignment: .trailing) {
                        Button(action: {
                            isNoteSheetShown.toggle()
                        }, label: {
                            Text("Go to your Notes")
                        })
                        .sheet(isPresented: $isNoteSheetShown, content: {
                            NotesView()
                                .presentationDetents([.large])
                           
                        })
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)

                    
                    notesEntryView
                    
                    if !noteTitle.isEmpty && !notesAbstract.isEmpty {
                        Button(action: {
                            
                        
                           
                     //      addNotes()
                        }, label: {
                            Text("Add Note")
                                .padding([.horizontal, .vertical], 8)
                                .foregroundStyle(.white)
                                .background(.lavender)
                                .cornerRadius(10)
                        })
                        .padding()
                        .buttonStyle(.plain)
                    }
                }
            }
        }
        
        var notesEntryView: some View {
            VStack(spacing: 30) {
                VStack(alignment: .leading) {
                    Text("Title")
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                    
                    TextField("", text: $noteTitle)
                        .padding()
                        .foregroundStyle(.white)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                        .placeholder(when: noteTitle.isEmpty) {
                            Text("Naming Your Notes will help organization").foregroundColor(.gray)
                                .padding(.horizontal)
                        }
                }
                
                VStack(alignment: .leading) {
                    Text("Description")
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                    
                    TextField("", text: $notesAbstract)
                        .padding()
                        .foregroundStyle(.white)
                        .background(RoundedRectangle(cornerRadius: 10)
                            .fill(.gray.opacity(0.1)))
                        .placeholder(when: noteTitle.isEmpty) {
                            Text("What would you like to note").foregroundColor(.gray)
                                .padding(.horizontal)
                        }
                }
                .padding(.top)
                Spacer()
            }
            .padding(.horizontal, 20)
        }
}

#Preview {
    NavigationStack {
        NotesLogView()
    }
}
