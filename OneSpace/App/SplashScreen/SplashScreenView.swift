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
    
    let fullText = "oneSpace"
    @State private var displayedText = ""
    @State private var currentIndex = 0

    var body: some View {
        UnderScoredTextView(
            text: displayedText,
            textColor: themeManager.theme.primary,
            underscoreColor: themeManager.theme.accentRed,
            font: .museoModerno(
                .black,
                size: 55
            )
        )
        .onAppear {
            displayedText = ""
            currentIndex = 0
            typeNextCharacter()
        }
    }

    func typeNextCharacter() {
        let typingInterval = 0.15

        guard currentIndex < fullText.count else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + typingInterval) {
            let index = fullText.index(fullText.startIndex, offsetBy: currentIndex)
            displayedText += String(fullText[index])
            currentIndex += 1
            typeNextCharacter()
        }
    }
}
