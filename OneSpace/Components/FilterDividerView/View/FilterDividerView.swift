//
//  FilterDividerView.swift
//  OneSpace
//
//  Created by Aditya Raj on 17/08/25.
//

import SwiftUI

struct FilterDividerView: View {
    @EnvironmentObject var themeManager: ThemeManager
    
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            PillView(
                data: .init(
                    text: "First",
                    textColor: themeManager.theme.accentRed,
                    font: .museoModerno(.regular, size: 16),
                    borderData: .init(width: 2, widthColor: themeManager.theme.accentRed),
                    cornerRadius: 20,
                    padding: .init(top: 6, leading: 12, bottom: 6, trailing: 12)
                )
            )
            
            RoundedRectangle(cornerRadius: 10)
                .fill(themeManager.theme.accentRed)
                .frame(height: 4)
        }
    }
}
