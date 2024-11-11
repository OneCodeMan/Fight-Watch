//
//  EventDetailView.swift
//  Fight Watch
//
//  Created by Dave Gumba on 2024-11-11.
//

import SwiftUI

struct EventDetailView: View {
    let event: FightEvent
    
    var body: some View {
        ScrollView {

            VStack {
                Text(event.title)
                    .font(.eventNameFont)
                    .padding(.top, 2)
                Text(event.location)
                    .font(.eventLocationFont)
                    .padding(1)
                Text(event.date)
                    .font(.eventDateFont)
                    .padding(1)
                Text(event.daysFromNow)
                    .font(.eventDaysFromNowFont)
                    .foregroundStyle(.red)
            }
            .padding()
            
            
            Divider()
            
            ForEach(event.fights, id: \.self) { fight in
                HStack {
                    
                    Circle()
                        .frame(width: 30, height: 30)
                        .padding(.leading, 2)
                    
                    VStack {
                        Text(fight.fighterOne.name)
                            .minimumScaleFactor(0.8)
                            .multilineTextAlignment(.center)
                            .font(.fighterNameFont)
                        
                        Text(fight.fighterOne.record)
                            .font(.fighterRecordFont)
                            .italic()
                            .padding(.top, 4)
                    }
                    .padding()
                    
                    Text("vs.")
                        .padding([.trailing, .leading], 2)
                    
                    VStack {
                        Text(fight.fighterTwo.name)
                            .minimumScaleFactor(0.8)
                            .multilineTextAlignment(.center)
                            .font(.fighterNameFont)
                        
                        Text(fight.fighterTwo.record)
                            .font(.fighterRecordFont)
                            .italic()
                            .padding(.top, 4)
                    }
                    .padding()
                    
                    Circle()
                        .frame(width: 30, height: 30)
                        .padding(.trailing, 2)
                }
                .padding()
                
                Divider()
                
                
            }
        } // ScrollView
        .padding()
        
    }
}

#Preview {
    EventDetailView(event: MockData.mockEvent1)
}
