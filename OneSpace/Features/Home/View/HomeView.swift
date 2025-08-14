//
//  HomeView.swift
//  OneSpace
//
//  Created by Aditya Raj on 09/08/25.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @EnvironmentObject var themeManager: ThemeManager
    
    var body: some View {
        VStack {
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
            
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack {
                    ForEach(0..<10, id: \.self) { index in
                        PillView(
                            data: .init(
                                text: "Monday",
                                textColor: themeManager.theme.accentRed,
                                font: .museoModerno(.regular, size: 16),
                                borderData: .init(width: 2, widthColor: themeManager.theme.accentRed),
                                cornerRadius: 20,
                                padding: .init(top: 6, leading: 12, bottom: 6, trailing: 12)
                            )
                        )
                        .pressEffect {
                            print("index -> \(index)")
                        }
                    }
                }
                .padding()
            })
        }
    }
}
