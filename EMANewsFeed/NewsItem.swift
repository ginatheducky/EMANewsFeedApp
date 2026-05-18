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
import SwiftUI

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
    
    var categoryItems: [Category] {
        categories.map { Category(from: $0) }
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

enum Category: String, CaseIterable {
    case corporate = "Corporate"
    case herbal = "Herbal"
    case human = "Human"
    case veterinary = "Veterinary"
    
    case unknown
    
    // Convert from raw string
    init(from string: String) {
        self = Category(rawValue: string) ?? .unknown
    }
    
    // display name
    var title: String {
        switch self {
        case .corporate: return "Corporate"
        case .herbal: return "Herbal"
        case .human: return "Human"
        case .veterinary: return "Veterinary"
        case .unknown: return "Other"
        }
    }

    // color for each category
    var color: Color {
        switch self {
        case .corporate: return .blue
        case .herbal: return .green
        case .human: return .yellow
        case .veterinary: return .red
        case .unknown: return .gray
        }
    }
    
    var symbol: String {
        switch self {
            case .corporate: return "building.2"
            case .herbal: return "leaf"
            case .human: return "person"
            case .veterinary: return "pawprint"
            case .unknown: return "questionmark"
        }
    }
}
