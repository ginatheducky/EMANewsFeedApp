//
//  NewsItemView.swift
//  EMANewsFeed
//
//  Created by Gina on 29.04.26.
//

import SwiftUI

struct NewsItemView: View {
    let newsItem: NewsItem
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(newsItem.title)
                .font(.title2)
                .foregroundStyle(.emadarkblue)
            Text(newsItem.firstPublishedDate?.formatted(.dateTime.day().month(.wide).year())
                 ?? "Date not available.")
            Text(newsItem.categories ?? "")
            Text(newsItem.topics ?? "")
            Text(newsItem.newsSummary ?? "No summary available.")
        }
        .padding()
    }
}

#Preview {
    NewsItemView(newsItem: .preview)
}
