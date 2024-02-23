import SwiftUI

struct NotesView: View {
    @State private var noteDemo = ["I completed 400 jumpropes", "I went to failure with bench press (225lb 4 reps)", "I hit 100 pushup for 2 sets"]
    
    @State private var selection: String?
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 2)  {
                Text("NOTES")
                    .font(.system(size: 30))
                Text("Always Take Notes Of Your Failure and Progess")
                    .font(.system(size: 15))
                    .foregroundStyle(Color.secondary)
                
                Rectangle()
                    .fill(Color.lavender)
                    .frame(height: 3)
            }
            
            notesList
        }
        .padding(.horizontal, 15)
    }
    
    var notesList: some View {
        List {
            ForEach(noteDemo, id: \.self) { note in
                Text(note)
                    .font(.system(size: 18))
            }
            .onDelete { offset in
                noteDemo.remove(atOffsets: offset)
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    NotesView()
}
