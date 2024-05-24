import SwiftUI
import SwiftData

struct NotesLogView: View {
    @Environment(\.modelContext) var modelContext
    
    @State private var noteTitle: String = ""
    @State private var noteAbstract: String = ""
    @State private var isNoteSheetShown: Bool = false
    @Binding var isNotesView: Bool
    @State private var animateIcon = false
    
    
    var body: some View {
        VStack {
            Text("Log Station")
                .foregroundStyle(.white)
                .bold()
            
            VStack {
                Text("Swipe down to exit")
                VStack {
                    Image(systemName: "chevron.down")
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                        .padding(.top, 2)
                        .offset(y: animateIcon ? 10 : -10)
                        .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true), value: animateIcon)
                        .onAppear {
                            animateIcon = true
                        }
                    Image(systemName: "chevron.down")
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                        .padding(.top, 2)
                        .offset(y: animateIcon ? 10 : -10)
                        .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true), value: animateIcon)
                        .onAppear {
                            animateIcon = true
                        }
                }
            }
            .padding(.top, 5)
            
            if isNotesView {
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
            }
            
            notesEntryView
            
            if !noteTitle.isEmpty && !noteAbstract.isEmpty {
                Button(action: {
                    noteTitle = ""
                    noteAbstract = ""
                    print(isNoteSheetShown.description)
                    addNotes()
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
                
                TextField("", text: $noteAbstract)
                    .padding()
                    .foregroundStyle(.white)
                    .background(RoundedRectangle(cornerRadius: 10)
                        .fill(.gray.opacity(0.1)))
                    .placeholder(when: noteTitle.isEmpty) {
                        Text("What would you like to note").foregroundColor(.gray)
                            .padding(.horizontal)
                    }
            }
            .padding(.top, 5)
        }
        .padding(.horizontal, 20)
    }
}

extension NotesLogView {
    func addNotes() {
        let title = self.noteTitle
        let description = self.noteAbstract
        let newNote = Notes(title: title, abstract: description)
        
        modelContext.insert(newNote)
    }
}

#Preview {
    NavigationStack {
        NotesLogView(isNotesView: .constant(false))
    }
}
