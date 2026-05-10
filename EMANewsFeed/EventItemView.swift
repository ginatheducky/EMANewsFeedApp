//
//  EventItemView.swift
//  EMANewsFeed
//
//  Created by christina on 10.05.26.
//

import SwiftUI

struct EventItemView: View {
    let eventItem: EventItem
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(eventItem.title)
                .font(.title2)
                .foregroundStyle(.emadarkblue)
            HStack {
                Text("Date:")
                    .fontWeight(.semibold)
                Text(eventItem.dateStartEndDates ?? "No date available.")
            }
            HStack {
                Text("Live Broadcast:")
                    .fontWeight(.semibold)
                Text(eventItem.liveBroadcast ?? "No info available.")
            }
            HStack {
                Text("Online:")
                    .fontWeight(.semibold)
                Text(eventItem.online ?? "No info available")
            }
            HStack {
                Text("Location:")
                    .fontWeight(.semibold)
                Text(eventItem.location ?? "No info available")
            }
        }
        .padding()
    }
}

#Preview {
    EventItemView(eventItem: .preview)
}
