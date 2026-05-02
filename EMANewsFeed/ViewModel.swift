//
//  ViewModel.swift
//  EMANewsFeed
//
//  Created by christina on 01.05.26.
//

import Foundation

@Observable
@MainActor
class ViewModel {
    enum FetchStatus {
        case notStarted
        case fetching
        case success
        case failed(error: Error)
    }
    
    private(set) var fetchStatus: FetchStatus = .notStarted
    private let fetcher = FetchService()
    
    private(set) var newsItems: [NewsItem] = []
    private(set) var eventItems: [EventItem] = []
    
    func getNewsData() async {
        fetchStatus = .fetching
        
        do {
            newsItems = try await fetcher.fetchNewsItems()
            fetchStatus = .success
        } catch {
            fetchStatus = .failed(error: error)
        }
    }
    
    func getEventData() async {
        fetchStatus = .fetching
        
        do {
            eventItems = try await fetcher.fetchEventItems()
            fetchStatus = .success
        } catch {
            fetchStatus = .failed(error: error)
        }
    }
}
