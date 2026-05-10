//
//  NewsView.swift
//  EMANewsFeed
//
//  Created by christina on 01.05.26.
//

import SwiftUI

struct NewsView: View {
    @State private var vm = ViewModel()
    
    var body: some View {
        NavigationStack {
            List(vm.newsItems) { item in
                NavigationLink {
                    NewsItemView(newsItem: item)
                } label: {
                    Text(item.title)
                }
            }
            .task {
                await vm.getNewsData()
            }
        }
    }
}

#Preview {
    NewsView()
}
