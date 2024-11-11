//
//  EventDetailView.swift
//  Fight Watch
//
//  Created by Dave Gumba on 2024-11-11.
//

import SwiftUI

struct EventDetailView: View {
    let event: Event
    
    var body: some View {
        ScrollView {
            Text(event.title)
            Text(event.organization)
            Text(event.date)
            
            ForEach(event.fights, id: \.self) { fight in
                HStack {
                    Circle()
                        .frame(width: 30, height: 30)
                    VStack {
                        Text(fight.fighterOne.name)
                        Text(fight.fighterOne.record)
                    }
                    
                    Text("vs.")
                    
                    VStack {
                        Text(fight.fighterTwo.name)
                        Text(fight.fighterTwo.record)
                    }
                    Circle()
                        .frame(width: 30, height: 30)
                }
                .padding()
                
                Divider()
                
                
            }
        }
        
    }
}

//#Preview {
//    EventDetailView()
//}
