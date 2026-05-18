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
            Text(newsItem.categories.joined(separator: ", "))
            Text(newsItem.topics ?? "")
            Text(newsItem.newsSummary ?? "No summary available.")
        }
        .padding()
    }
}


#Preview {
    NewsItemView(
        newsItem: NewsItem(
            title: "Test Meeting highlights from the Committee for Veterinary Medicinal Products (CVMP) 14-16 April 2026",
            pressRelease: "No",
            categories: ["Human", "Corporate"],
            topics: "Medicines;Vaccines",
            newsSummary: "Outcomes of the Committee for Veterinary Medicinal Products (CVMP) meeting",
            firstPublishedDateString: "17/04/2026",
            newsUrl: URL(string: "https://www.ema.europa.eu/en/news/meeting-highlights-committee-veterinary-medicinal-products-cvmp-14-16-april-2026")!
        )
    )
}

