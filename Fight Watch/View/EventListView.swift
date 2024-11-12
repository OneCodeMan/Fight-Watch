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
                    VStack(alignment: .leading) {
                        Text(event.title)
                            .font(.eventListItemTitle)
                        
                        HStack {
                            Text(event.organization.lastWord.dropFirst().dropLast())
                                .font(.eventListItemOrganization)
                            Text("|")
                            Text(event.date)
                                .font(.eventListItemDate)
                                .italic()
                        }
                    }
                    .padding()
                    // end of EventListItemView
                }
                .listRowSeparator(.hidden)
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

// TODO: PUT IN SEPARATE FILES
func delay(interval: TimeInterval, closure: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + interval, execute: closure)
}

extension String {
    var lastWord: String {
        let words = self.split(separator: " ")
        return words.last.map(String.init) ?? ""
    }
}
