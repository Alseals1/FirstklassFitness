//
//  ContentView.swift
//  FirstKlassFitness
//
//  Created by Alandis Seals on 1/14/24.
//

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
                    }
                HomeView()
                    .tabItem{
                        Label("Statistics", systemImage: "waveform.path.ecg")
                    }
                HomeView()
                    .tabItem{
                      Label("Notes", systemImage: "list.clipboard")
                    }
                HomeView()
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
