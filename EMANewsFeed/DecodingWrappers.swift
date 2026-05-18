//
//  DecodingWrappers.swift
//  EMANewsFeed
//
//  Created by christina on 18.05.26.
//

import Foundation

@propertyWrapper
struct SemicolonSeparatedArray: Decodable {
    var wrappedValue: [String]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let raw = (try? container.decode(String.self)) ?? ""
        
        wrappedValue = raw
            .split(separator: ";")
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
    }
    
    init(wrappedValue: [String] = []) {
        self.wrappedValue = wrappedValue
    }
}
