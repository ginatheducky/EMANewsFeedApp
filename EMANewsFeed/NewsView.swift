//
//  NewsView.swift
//  EMANewsFeed
//
//  Created by christina on 01.05.26.
//

import SwiftUI

struct NewsView: View {
    var vm = ViewModel()
    
    var body: some View {
        List(vm.newsItems) { item in
            Text(item.title)
        }
        .task {
            await vm.getNewsData()
        }
    }
}

#Preview {
    NewsView()
}
