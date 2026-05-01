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
