import SwiftUI

struct NotesView: View {
    @State private var noteDemo = ["I completed 400 jumpropes", "I went to failure with bench press (225lb 4 reps)", "I hit 100 pushup for 2 sets"]
    
    @State private var selection: String?
    
    var body: some View {
    
            VStack(alignment: .leading, spacing: 2)  {
                HStack {
                    Text("NOTES")
                        .font(.system(size: 30))
                    Spacer()
                    Button(action: {
                        // Action when button is tapped
                    }) {
                        Image(systemName: "plus")
                            .font(.system(size: 30, weight: .bold))
                            .foregroundColor(.white)
                            .padding(10)
                            .background(.lavender)
                            .clipShape(Circle())
                            .shadow(color: Color.gray.opacity(0.6), radius: 20, x: 0, y: 5)
                    }
                    .padding(.trailing, 15)
                }
                Text("Always Take Notes Of Your Failure and Progess")
                    .font(.system(size: 15))
                    .foregroundStyle(Color.secondary)
                    
                
                Rectangle()
                    .fill(Color.lavender)
                    .frame(height: 3)
                
                VStack {
                    notesList
                }
            }
    }
    
    var notesList: some View {
        List {
            ForEach(workoutNotes) { note in
                VStack(alignment: .leading, spacing: 5) {
                    Text(note.title)
                        .font(.system(size: 18, weight: .bold))
                    Text(note.abstract)
                        .font(.system(size: 18))
                        .offset(x: 10)
                }
               
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
