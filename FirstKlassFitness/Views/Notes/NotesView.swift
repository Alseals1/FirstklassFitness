import SwiftUI
import SwiftData

struct NotesView: View {
    @Query var notes: [Notes]
    @Environment(\.modelContext) var modelContext
    @State private var selection: String?
    @State private var noteLogShown: Bool = false
    @State var noteToEdit: Notes?
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 2)  {
                VStack(alignment: .leading) {
                    HStack {
                        Text("NOTES")
                            .font(.custom("Oswald-Bold", size: 30))
                           
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
                        .font(.custom("Oswald-Regular", size: 14))
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
        .sheet(item: $noteToEdit) { note in
            NoteEditingView(note: note)
        }
    }
    
    var notesList: some View {
        List {
            ForEach(notes) { note in
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(note.title)
                            .font(.custom("Oswald-Bold", size: 18))
                            .foregroundStyle(.white)
                        Text(note.abstract)
                            .font(.custom("Oswald-Regular", size: 16))
                            .foregroundStyle(.charcoalGray)
                            .offset(x: 10)
                }
                    Spacer()
                    Image(systemName: "arrow.right")
                }
                    .onTapGesture {
                        noteToEdit = note
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
