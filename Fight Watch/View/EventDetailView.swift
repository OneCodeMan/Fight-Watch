//
//  EventDetailView.swift
//  Fight Watch
//
//  Created by Dave Gumba on 2024-11-11.
//

import SwiftUI
import EventKit

struct EventDetailView: View {
    @Environment(\.openURL) var openURL
    @Environment(\.colorScheme) var colorScheme
    @StateObject var adViewModel: InterstitialViewModel = InterstitialViewModel()
    let event: FightEvent
    
    @State var daysFromNow: String = ""
    
    @State var displayAddToCalendarModal: Bool = false
    @State var displayAddToCalendarConfirmationModal: Bool = false
    @State private var alertTitle: String = ""
    @State private var alertMessage: String = ""
    
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
                
                Button {
                    self.displayAddToCalendarModal = true
                    requestCalendarAccess(CalendarFightEvent(title: event.title, date: event.eventDate ?? Date(), description: "\(event.title)!!!"))
                    
                } label: {
                    Text("Add to Your Calendar")
                        .padding()
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .background(Color.teal)
                        .cornerRadius(10)
                }
                .padding()
                .shadow(color: .teal, radius: 2, y: 2)
                
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
            .alert("Add this card to your calendar?", isPresented: $displayAddToCalendarModal) {
                Button(String(localized: "YES")) {
//                    self.displayAddToCalendarModal = false
                    self.displayAddToCalendarConfirmationModal = true
                }
                Button(String(localized: "NO"), role: .destructive) {
                }
            }
            .alert("\(event.title) Added To Calendar", isPresented: $displayAddToCalendarConfirmationModal) {
                Button(String(localized: "OK")) {
                }
                Button(String(localized: "Take Me To My Calendar")) {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "MMM d, yyyy"
                    if let date = dateFormatter.date(from: event.date) {
                        let timestamp = date.timeIntervalSinceReferenceDate
                        if let calendarURL = URL(string: "calshow:\(timestamp)") {
                            UIApplication.shared.open(calendarURL, options: [:], completionHandler: nil)
                        }
                    }
                    
                }
            }
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
        let components = calendar.dateComponents([.day, .hour], from: .now, to: eventDate)
        if let daysAwayFrom = components.day, let hoursAwayFrom = components.hour {
            if daysAwayFrom == 0 && hoursAwayFrom < 14 {
                self.daysFromNow = "TODAY"
            } else if daysAwayFrom == 0 && hoursAwayFrom > 14 {
                self.daysFromNow = "1 day from now"
            } else if daysAwayFrom == 1 && hoursAwayFrom > 5 {
                self.daysFromNow = "1 day from now"
            } else {
                self.daysFromNow = "\(daysAwayFrom) days from now"
            }
            
        } else {
            print("Can't compute days away from")
        }
        // TODO: FIX
        self.daysFromNow = ""
    }
    
    private func requestCalendarAccess(_ event: CalendarFightEvent) {
        let eventStore = EKEventStore()
        
        eventStore.requestWriteOnlyAccessToEvents() { (granted, error) in
            if granted && error == nil {
                let calendarEvent = EKEvent(eventStore: eventStore)
                calendarEvent.title = event.title
                calendarEvent.startDate = event.date
                calendarEvent.endDate = event.date.addingTimeInterval(3600)
                calendarEvent.notes = event.description
                calendarEvent.calendar = eventStore.defaultCalendarForNewEvents
                
                do {
                    try eventStore.save(calendarEvent, span: .thisEvent)
                    alertTitle = "Event Added"
                    alertMessage = "The event has been successfully added to your calendar."
                    displayAddToCalendarModal = true
                } catch {
                    alertTitle = "Error"
                    alertMessage = "There was an error adding the event to your calendar."
                    displayAddToCalendarModal = true
                }
            } else {
                alertTitle = "Error"
                alertMessage = "Access to the calendar was denied."
                displayAddToCalendarModal = true
            }
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

// https://medium.com/@thibault.giraudon/how-to-add-events-to-your-calendar-using-swiftui-and-eventkit-9b81528bf397 step 3
struct CalendarFightEvent: Identifiable {
    let id: UUID = UUID()
    let title: String
    let date: Date
    let description: String
}
