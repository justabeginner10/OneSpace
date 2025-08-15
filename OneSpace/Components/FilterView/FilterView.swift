//
//  FilterView.swift
//  OneSpace
//
//  Created by Aditya Raj on 14/08/25.
//

import SwiftUI
import Combine

struct FilterView: View {
    @EnvironmentObject var themeManager: ThemeManager
    @StateObject private var viewManager: FilterManager
    
    init(viewManager: FilterManager) {
        self._viewManager = StateObject(wrappedValue: viewManager)
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            LazyHStack(spacing: viewManager.layoutData.containerLayoutData.nodesInterspacing) {
                ForEach(viewManager.filterData, id: \.id) { filterItem in
                    if let index = viewManager.filterData.firstIndex(where: { $0.id == filterItem.id }) {
                        PillView(
                            data: .init(
                                text: viewManager.getText(for: index),
                                textColor: viewManager.getTextColor(for: index),
                                font: viewManager.getFont(for: index),
                                borderData: .init(width: filterItem.borderWidth, widthColor: viewManager.getBorderColor(for: index)),
                                cornerRadius: viewManager.layoutData.singleNodeLayoutData.nodesCornerRadius,
                                backgroundColor: viewManager.getBackgroundColor(for: index),
                                padding: viewManager.layoutData.singleNodeLayoutData.nodesInterPadding
                            )
                        )
                        .pressEffect {
                            filterItem.onFilterSelection.send(filterItem.id)
                        }
                    }
                }
            }
            .padding(viewManager.layoutData.containerLayoutData.wrapperPadding)
        })
    }
}
