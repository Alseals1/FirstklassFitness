import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            TabView {
                HomeView()
                    .tabItem{
                       Label("Home", systemImage: "house")
                            .foregroundStyle(Color.lavender, Color.lavender)
                            
                    }
                StatisticView()
                    .tabItem{
                        Label("Statistics", systemImage: "waveform.path.ecg")
                    }
               NotesView()
                    .tabItem{
                      Label("Notes", systemImage: "list.clipboard")
                    }
                Text("Setting View")
                    .tabItem{
                        Label("Setting", systemImage: "gear")
                    }
            }
        }
    }
}

#Preview {
    ContentView()
        
}
