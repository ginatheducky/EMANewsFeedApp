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
                .padding()
            
            VStack(alignment: .leading) {
                    Text(newsItem.firstPublishedDate?.formatted(.dateTime.day().month(.wide).year())
                         ?? "Date not available.")
                    
                    HStack {
                        ForEach(newsItem.categoryItems, id: \.self) { category in
                            Label(category.title, systemImage: category.symbol)
                                .padding(6)
                                .background(category.color.opacity(0.2))
                                .cornerRadius(8)
                        }
                    }
                }
                .ignoresSafeArea(edges: .horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color.emalightblue)

            HStack {
                ForEach(newsItem.topics, id: \.self) { topic in
                    Text("#\(topic)")
                        .font(.subheadline)
                        .lineLimit(1)
                        .fixedSize()   // important: keeps chip width correct
                        .padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .background(.gray.opacity(0.15), in: Capsule())
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()

            Text(newsItem.newsSummary ?? "No summary available.")
                .padding(.horizontal)
        }
    }
}


#Preview {
    NewsItemView(
        newsItem: NewsItem(
            title: "Test Meeting highlights from the Committee for Veterinary Medicinal Products (CVMP) 14-16 April 2026",
            pressRelease: "No",
            categories: ["Human", "Corporate"],
            topics: ["Medicines", "Vaccines", "Test", "HumusSauce"],
            newsSummary: "Outcomes of the Committee for Veterinary Medicinal Products (CVMP) meeting",
            firstPublishedDateString: "17/04/2026",
            newsUrl: URL(string: "https://www.ema.europa.eu/en/news/meeting-highlights-committee-veterinary-medicinal-products-cvmp-14-16-april-2026")!
        )
    )
}

