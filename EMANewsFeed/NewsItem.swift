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

// Categories: Corporate, Herbal, Human, Veterinary
// sometimes more than one separated by ; e.g. "Human;Veterinary;Corporate"

import Foundation

struct EMANewsResponse: Decodable {
    let data: [NewsItem]
}

struct NewsItem: Decodable, Identifiable {
    let title: String
    let pressRelease: String?
    @SemicolonSeparatedArray var categories: [String] = []
    @SemicolonSeparatedArray var topics: [String] = []
    let newsSummary: String?
    private(set) var firstPublishedDateString: String?
    let newsUrl: URL
    
    var id: URL { newsUrl }
    
    var firstPublishedDate: Date? {
        guard let s = firstPublishedDateString, !s.isEmpty else { return nil }
        return Self.emaDateFormatter.date(from: s)
    }
    
    enum CodingKeys: String, CodingKey {
        case title
        case pressRelease = "press_release"
        case categories
        case topics
        case newsSummary = "news_summary"
        case firstPublishedDateString = "first_published_date"
        case newsUrl = "news_url"
    }
    
    
    private static let emaDateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.locale = Locale(identifier: "en_US_POSIX")
        df.dateFormat = "dd/MM/yyyy"
        return df
    }()
}
