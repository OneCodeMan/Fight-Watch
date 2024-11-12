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


// MARK: Octagon View for vs.
struct OctagonTextView: View {
    @Environment(\.colorScheme) var colorScheme
    var text: String
    var body: some View {
        ZStack {
            OctagonShape()
                .stroke(colorScheme == .dark ? Color.white : Color.black, lineWidth: 1)
                .frame(width: 50, height: 50)
            Text(text)
                .font(.title)
                .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                .padding(2)
        }
    }
}
struct OctagonShape: Shape {
    func path(in rect: CGRect) -> Path {
        let size = min(rect.width, rect.height)
        let sideLength = size / (2 + sqrt(2))
        let offset = (size - sideLength) / 2

        return Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY + offset))
            path.addLine(to: CGPoint(x: rect.maxX - offset, y: rect.minY + offset))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.maxX - offset, y: rect.maxY - offset))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX + offset, y: rect.maxY - offset))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.minX + offset, y: rect.minY + offset))
            path.closeSubpath()
        }
    }
}

#Preview {
    EventDetailView(event: MockData.mockEvent1)
}
