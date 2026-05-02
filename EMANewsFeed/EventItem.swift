//
//  EventItem.swift
//  EMANewsFeed
//
//  Created by christina on 02.05.26.
//

// JSON data from EMA
// {
//      "meta" : { ... },
//      "data" : [ { event item }, { event item }]
// }

import Foundation

struct EMAEventsResponse: Decodable {
    let data: [EventItem]
}

struct EventItem: Decodable, Identifiable {
    let title: String
    let dateStartEndDates: String?
    let liveBroadcast: String?
    let online: String?
    let location: String?
    let eventUrl: URL
    
    var id: URL { eventUrl }
    
    enum CodingKeys: String, CodingKey {
        case title
        case dateStartEndDates = "date_start_end_dates"
        case liveBroadcast = "live_broadcast"
        case online = "online"
        case location = "location"
        case eventUrl = "event_url"
    }
}
