//
//  EventsView.swift
//  EMANewsFeed
//
//  Created by christina on 02.05.26.
//

import SwiftUI

struct EventsView: View {
    var vm = ViewModel()
    
    var body: some View {
        List(vm.eventItems) { item in
            Text(item.title)
        }
        .task {
            await vm.getEventData()
        }
    }
}

#Preview {
    EventsView()
}
