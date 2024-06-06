import SwiftUI
import SwiftData

struct NotesView: View {
    @Query var notes: [Notes]
    @Environment(\.modelContext) var modelContext
    @State private var selection: String?
    @State private var noteLogShown: Bool = false
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 2)  {
                VStack(alignment: .leading) {
                    HStack {
                        Text("NOTES")
                            .font(.system(size: 30))
                        
                           
                        Spacer()
                        Button(action: {
                            noteLogShown.toggle()
                        }) {
                            Image(systemName: "plus")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.white)
                                .padding(5)
                                .background(.lavender)
                                .clipShape(Circle())
                                .shadow(color: Color.gray.opacity(0.6), radius: 20, x: 0, y: 5)
                        }
                        .padding(.trailing, 15)
                        .sheet(isPresented: $noteLogShown, content: {
                            NotesLogView(isNotesView: .constant(false))
                                .presentationDetents([.fraction(0.50), .medium])
                        })
                    }
                    Text("Always Take Notes Of Your Failure and Progess")
                        .font(.system(size: 15))
                        .foregroundStyle(Color.secondary)
                        
                    
                    Rectangle()
                        .fill(Color.lavender)
                        .frame(height: 3)
                }
                .padding([.leading, .top])
                
                VStack {
                    notesList
                }
            }
        }
           
           
    }
    
    var notesList: some View {
        List {
            ForEach(notes) { note in
                NavigationLink {
                    NoteEditView(noteLogShown: $noteLogShown)
                } label: {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(note.title)
                            .font(.system(size: 18, weight: .bold))
                        Text(note.abstract)
                            .font(.system(size: 18))
                            .offset(x: 10)
                    }
                }
                
                
            }
            .onDelete(perform: deleteNote)
        }
        .listStyle(.plain)
    }
}

extension NotesView {
    func deleteNote(_ indexSet: IndexSet) {
        for index in indexSet {
            let note  = notes[index]
            modelContext.delete(note)
        }
    }
}


//#Preview {
//    NotesView()
//}
