//
//  ContentView.swift
//  EMANewsFeed
//
//  Created by Gina on 29.04.26.
//

import SwiftUI

struct ContentView: View {
    @State private var vm = ViewModel()
    
    var body: some View {
        TabView {
            Tab("News", systemImage: "newspaper") {
                NavigationStack {
                    List(vm.newsItems) { item in
                        NavigationLink {
                            NewsItemView(newsItem: item)
                        } label: {
                            Text(item.title)
                        }
                    }
                    .navigationTitle("News")
                    .task { await vm.getNewsData() }
                }
                .toolbarBackgroundVisibility(.visible, for: .tabBar)
            }
            
            Tab("Events", systemImage: "calendar") {
                NavigationStack {
                    List(vm.eventItems) { item in
                        NavigationLink {
                            EventItemView(eventItem: item)
                        } label: {
                            Text(item.title)
                        }
                    }
                    .navigationTitle("Events")
                    .task { await vm.getEventData() }
                }
                .toolbarBackgroundVisibility(.visible, for: .tabBar)
            }
        }
    }
}

#Preview {
    ContentView()
}
