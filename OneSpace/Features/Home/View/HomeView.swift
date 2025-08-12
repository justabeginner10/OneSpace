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
    @State private var isSelected: Bool = false
    
    var body: some View {
        VStack {
            PillView(
                data: .init(
                    text: "Monday",
                    textColor: isSelected ? themeManager.theme.background : themeManager.theme.accentRed,
                    font: .museoModerno(.regular, size: 16),
                    borderData: .init(width: 2, widthColor: themeManager.theme.accentRed),
                    cornerRadius: 20,
                    backgroundColor: isSelected ? themeManager.theme.accentRed : .clear,
                    padding: .init(top: 6, leading: 12, bottom: 6, trailing: 12)
                )
            )
            .pressEffect {
                withAnimation(.smooth) {
                    isSelected.toggle()
                }
            }
        }
    }
}
