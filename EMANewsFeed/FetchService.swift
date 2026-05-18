//
//  FetchService.swift
//  EMANewsFeed
//
//  Created by christina on 30.04.26.
//

// EMA json data strings
// news: https://www.ema.europa.eu/en/documents/report/news-json-report_en.json
// events: https://www.ema.europa.eu/en/documents/report/events-json-report_en.json

import Foundation

struct FetchService {
    private enum FetchError: Error {
        case badResponse
    }
    
    private let baseURL = URL(string: "https://www.ema.europa.eu/en/documents/report")!
    
    func fetchNewsItems() async throws -> [NewsItem] {
        // build the fetch URL
        let newsItemsURL = baseURL.appending(path: "news-json-report_en.json")
        
        // try and fetch data
        let (data, response) = try await URLSession.shared.data(from: newsItemsURL)
        
        // handle response from server which is a status code, a 3 digit number
        // we check if it was a good response with response code 200
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw FetchError.badResponse
        }
        
        let decoder = JSONDecoder()
        
        let df = DateFormatter()
        df.locale = Locale(identifier: "en_US_POSIX")
        df.dateFormat = "dd/MM/yyyy"
        decoder.dateDecodingStrategy = .formatted(df)
        
        // decode the data
        let newsItems = try decoder.decode(EMANewsResponse.self, from: data)
        //let newsItems = try JSONDecoder().decode(EMANewsResponse.self, from: data)
        
        // return the newsItem
        return newsItems.data
    }
    
    func fetchEventItems() async throws -> [EventItem] {
        // build the fetch URL
        let eventsItemsURL = baseURL.appending(path: "events-json-report_en.json")
        
        // try and fetch data
        let (data, response) = try await URLSession.shared.data(from: eventsItemsURL)
        
        // handle response from server which is a status code, a 3 digit number
        // we check if it was a good response with response code 200
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw FetchError.badResponse
        }
        
        // decode the data
        let eventsItems = try JSONDecoder().decode(EMAEventsResponse.self, from: data)
        
        // return the newsItem
        return eventsItems.data
    }
}
