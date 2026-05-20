//
//  ContentView.swift
//  EMANewsFeed
//
//  Created by Gina on 29.04.26.
//

import SwiftUI

struct ContentView: View {
    @State private var vm = ViewModel()
    
    @State var searchText = ""
    
    var filteredNewsItems: [NewsItem] {
        if searchText.isEmpty {
            return vm.newsItems
        } else {
            return vm.newsItems.filter { newsItem in
                newsItem.title.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var filteredEventItems: [EventItem] {
        if searchText.isEmpty {
            return vm.eventItems
        } else {
            return vm.eventItems.filter { eventItem in
                eventItem.title.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        TabView {
            Tab("News", systemImage: "newspaper") {
                NavigationStack {
                    List(filteredNewsItems) { item in
                        NavigationLink {
                            NewsItemView(newsItem: item)
                        } label: {
                            Text(item.title)
                        }
                    }
                    .navigationTitle("News")
                    .task { await vm.getNewsData() }
                    .searchable(text: $searchText)
                    .autocorrectionDisabled()
                }
                .toolbarBackgroundVisibility(.visible, for: .tabBar)
            }
            
            Tab("Events", systemImage: "calendar") {
                NavigationStack {
                    List(filteredEventItems) { item in
                        NavigationLink {
                            EventItemView(eventItem: item)
                        } label: {
                            Text(item.title)
                        }
                    }
                    .navigationTitle("Events")
                    .task { await vm.getEventData() }
                    .searchable(text: $searchText)
                    .autocorrectionDisabled()
                }
                .toolbarBackgroundVisibility(.visible, for: .tabBar)
            }
        }
    }
}

#Preview {
    ContentView()
}
