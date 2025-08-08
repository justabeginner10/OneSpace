//
//  ContentView.swift
//  OneSpace
//
//  Created by Aditya Raj on 03/08/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @EnvironmentObject var themeManager: ThemeManager
    
    var body: some View {
        VStack(spacing: 12) {
            UnderScoredTextView(
                text: "oneSpace",
                textColor: themeManager.theme.background,
                underscoreColor: .red,
                font: .museoModerno(.black, size: 36)
            )
            
            UnderScoredTextView(
                text: "one place for all",
                textColor: .white,
                underscoreColor: .red,
                font: .museoModerno(.bold, size: 24)
            )
        }
    }
}
