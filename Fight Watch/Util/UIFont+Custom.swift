//
//  UIFont+Custom.swift
//  Fight Watch
//
//  Created by Dave Gumba on 2024-11-11.
//

import Foundation
import SwiftUI

extension Font {
    
    static var defaultFontSmallText: Font {
        return .system(size: 14.0)
    }
    
    static var pageTitleFont: Font {
        return .system(size: 32.0)
    }
    
    static var largeTitleFont: Font {
        return .system(size: 28.0, weight: .heavy)
    }
    
    // MARK: EventDetailView
    static var eventNameFont: Font {
        return .system(size: 26.0, weight: .bold)
    }
    
    static var eventLocationFont: Font {
        return .system(size: 12.0).italic()
    }
    
    static var eventDaysFromNowFont: Font {
        return .system(size: 18.0, weight: .medium)
    }
    
    static var eventDateFont: Font {
        return .system(size: 20.0)
    }
    
    static var fighterNameFont: Font {
        return .system(size: 19.0, weight: .semibold)
    }
    
    static var fighterRecordFont: Font {
        return .system(size: 12.0, weight: .thin)
    }
    
    static var detailTextFont: Font {
        return .system(size: 14.0)
    }
    
    static var detailTextItalicFont: Font {
        return .system(size: 14.0, weight: .thin)
    }
    
    // MARK: EventListView
    static var eventListItemTitle: Font {
        return .system(size: 22.0).bold()
    }
    
    static var eventListItemOrganization: Font {
        return .system(size: 14.0, weight: .bold)
    }
    
    static var eventListItemDate: Font {
        return .system(size: 15.0, weight: .medium)
    }
    
    
    // MARK: Misc

}
