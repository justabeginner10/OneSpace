//
//  CardsView.swift
//  OneSpace
//
//  Created by Aditya Raj on 16/08/25.
//

import SwiftUI

struct CardsView: View {
    @EnvironmentObject var themeManager: ThemeManager
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Water the plants")
                .font(.museoModerno(.semiBold, size: 24))
                .foregroundStyle(themeManager.theme.background)
            
            Text("water plants when leaving the house and please add some food for birds")
                .font(.museoModerno(.regular, size: 16))
                .foregroundStyle(themeManager.theme.background)
            
            HStack {
                Spacer()
                
                PillView(
                    data: .init(
                        text: "today",
                        textColor: themeManager.theme.accentRed,
                        font: .museoModerno(.regular, size: 16),
                        cornerRadius: 20,
                        backgroundColor: themeManager.theme.background,
                        padding: .init(top: 4, leading: 10, bottom: 4, trailing: 10)
                    )
                )
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(themeManager.theme.accentRed)
        )
    }
}
