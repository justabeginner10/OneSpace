//
//  HomeView.swift
//  OneSpace
//
//  Created by Aditya Raj on 09/08/25.
//

import Foundation
import SwiftUI

struct HomePageView: View {
    @EnvironmentObject var themeManager: ThemeManager
    
    var body: some View {
        UnderScoredTextView(
            text: "oneSpace",
            textColor: themeManager.theme.accentPurple,
            underscoreColor: themeManager.theme.primary,
            font: .museoModerno(.black, size: 36)
        )
        
        UnderScoredTextView(
            text: "one place for all",
            textColor: themeManager.theme.accentPurple,
            underscoreColor: themeManager.theme.primary,
            font: .museoModerno(.bold, size: 24)
        )
    }
}
