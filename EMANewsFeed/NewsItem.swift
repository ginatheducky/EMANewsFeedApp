//
//  NewsItem.swift
//  EMANewsFeed
//
//  Created by Christina on 29.04.26.
//

// JSON data from EMA
// {
//      "meta" : { ... },
//      "data" : [ { news item }, { news item }]
// }

import Foundation

struct EMANewsResponse: Decodable {
    let data: [NewsItem]
}

struct NewsItem: Decodable, Identifiable {
    let title: String
    let pressRelease: String?
    let categories: String?
    let topics: String?
    let newsSummary: String?
    let firstPublishedDate: String?
    let newsUrl: URL
    
    var id: URL { newsUrl }
    
    enum CodingKeys: String, CodingKey {
        case title
        case pressRelease = "press_release"
        case categories
        case topics
        case newsSummary = "news_summary"
        case firstPublishedDate = "first_published_date"
        case newsUrl = "news_url"
    }
}

// tatic sample NewsItem just for previews/testing
extension NewsItem {
    static let preview = NewsItem(
        title: "Meeting highlights from the Committee for Veterinary Medicinal Products (CVMP) 14-16 April 2026",
        pressRelease: "No",
        categories: "Human",
        topics: "Medicines;Vaccines",
        newsSummary: "Outcomes of the Committee for Veterinary Medicinal Products (CVMP) meeting",
        firstPublishedDate: "17/04/2026",
        newsUrl: URL(string: "https://www.ema.europa.eu/en/news/meeting-highlights-committee-veterinary-medicinal-products-cvmp-14-16-april-2026")!
    )
}
