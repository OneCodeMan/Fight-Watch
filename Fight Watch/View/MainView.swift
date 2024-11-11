//
//  MainView.swift
//  Fight Watch
//
//  Created by Dave Gumba on 2024-11-11.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        EventDetailView(event: MockData.mockEvent1)
    }
}

#Preview {
    MainView()
}
