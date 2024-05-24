import SwiftUI
import SwiftData

struct NoteEditView: View {
    @Environment(\.modelContext) var modelContext
    
    @State var title: String = ""
    @State var abstract: String = ""
    @State var notesDate: Date = .now
    
    @Binding var noteLogShown: Bool

    var body: some View {
        VStack {
            TextField("Title", text: $title)
            TextField("Description", text: $abstract)
            Text(notesDate.formatted())
            
            Button(action: {
                noteLogShown = false
                print("Latest Model Context \(Date.now) ======")
                dump("\(modelContext)")
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

extension NoteEditView {
    func addNotes() {
        let title = self.title
        let description = self.abstract
        let date = self.notesDate
        let newNote = Notes(title: title, abstract: description)
        
        modelContext.insert(newNote)
    }
}

#Preview {
    NoteEditView(noteLogShown: .constant(false))
}
