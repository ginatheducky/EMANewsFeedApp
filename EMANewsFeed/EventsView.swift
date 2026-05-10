//
//  EventsView.swift
//  EMANewsFeed
//
//  Created by christina on 02.05.26.
//

import SwiftUI

struct EventsView: View {
    @State private var vm = ViewModel()
    
    var body: some View {
        NavigationStack {
            List(vm.eventItems) { item in
                NavigationLink {
                    EventItemView(eventItem: item)
                } label: {
                    Text(item.title)
                }
            }
            .task {
                await vm.getEventData()
            }
        }
    }
}

#Preview {
    EventsView()
}
