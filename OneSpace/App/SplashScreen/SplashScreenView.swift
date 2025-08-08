//
//  SplashScreenView.swift
//  OneSpace
//
//  Created by Aditya Raj on 09/08/25.
//

import Foundation
import SwiftUI

struct SplashScreenView: View {
    @EnvironmentObject var themeManager: ThemeManager
    
    var body: some View {
        UnderScoredTextView(
            text: "one place for all",
            textColor: themeManager.theme.accentPurple,
            underscoreColor: themeManager.theme.accentOrange,
            font: .museoModerno(.black, size: 42)
        )
    }
}
