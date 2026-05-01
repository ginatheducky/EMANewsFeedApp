//
//  ContentView.swift
//  EMANewsFeed
//
//  Created by Gina on 29.04.26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("News", systemImage: "newspaper") {
                NewsView()
                    .toolbarBackgroundVisibility(.visible, for: .tabBar)
            }
            
            Tab("Events", systemImage: "calendar") {
                Text("Events")
                    .toolbarBackgroundVisibility(.visible, for: .tabBar)
            }
        }
    }
}

#Preview {
    ContentView()
}
