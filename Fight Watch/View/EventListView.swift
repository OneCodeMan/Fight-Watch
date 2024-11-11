//
//  EventListView.swift
//  Fight Watch
//
//  Created by Dave Gumba on 2024-11-11.
//

import SwiftUI

struct EventListView: View {
    let events: [FightEvent]
    var body: some View {
        VStack {
            
            List(events, id: \.self) { event in
                
                NavigationLink(destination: EventDetailView(event: event)) {
                    // EventListItemView
                    VStack {
                        Text(event.title)
                            .font(.eventListItemTitle)
                        
                        HStack {
                            Text(event.organization)
                            Text("|")
                            Text(event.date)
                        }
                    }
                    .padding()
                    
                    // end of EventListItemView
                }
            }
            
        }
        .navigationTitle("MMA Events")
        .onAppear {
            print("events list view")
        }
    }
}

#Preview {
    EventListView(events: MockData.mockEventsList)
}
