//
//  EventDetailView.swift
//  Fight Watch
//
//  Created by Dave Gumba on 2024-11-11.
//

import SwiftUI

struct EventDetailView: View {
    @Environment(\.openURL) var openURL
    @EnvironmentObject var adViewModel: InterstitialViewModel
    let event: FightEvent
    
    @State var daysFromNow: String = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Image(systemName: "link.circle.fill")
                    Text(event.title)
                        .font(.eventNameFont)
                        .onTapGesture {
                            openURL(URL(string: event.eventURL)!)
                        }
                    Text(event.location)
                        .font(.eventLocationFont)
                        .padding(1)
                    Text(event.date)
                        .font(.eventDateFont)
                        .padding(1)
                    Text(self.daysFromNow)
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
            .onAppear {
                self.computeDaysFromNow()
                
                delay(interval: 2.5) {
                    Task {
                        await adViewModel.showAd()
                    }
                }
            }
        }
    }
    
    // MARK: helper functions
    private func computeDaysFromNow() {
        let eventDate = event.eventDate ?? Date()
                
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: .now, to: eventDate)
        if let daysAwayFrom = components.day {
            self.daysFromNow = "\(daysAwayFrom) days from now"
        } else {
            print("Can't compute days away from")
        }
    }
}

#Preview {
    EventDetailView(event: MockData.mockEvent1)
}
