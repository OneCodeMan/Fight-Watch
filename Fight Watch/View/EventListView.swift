//
//  EventListView.swift
//  Fight Watch
//
//  Created by Dave Gumba on 2024-11-11.
//

import SwiftUI

struct EventListView: View {
    @EnvironmentObject var adViewModel: InterstitialViewModel
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
            delay(interval: 2.0) {
                Task {
                    await adViewModel.showAd()
                }
            }
            
        }
    }
}

#Preview {
    EventListView(events: MockData.mockEventsList)
}

func delay(interval: TimeInterval, closure: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + interval, execute: closure)
}
