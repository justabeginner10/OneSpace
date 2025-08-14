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
                    PillView(
                        data: .init(
                            text: viewManager.getText(for: filterItem),
                            textColor: viewManager.getTextColor(for: filterItem),
                            font: viewManager.getFont(for: filterItem),
                            borderData: .init(width: filterItem.borderWidth, widthColor: viewManager.getBorderColor(for: filterItem)),
                            cornerRadius: viewManager.layoutData.singleNodeLayoutData.nodesCornerRadius,
                            backgroundColor: viewManager.getBackgroundColor(for: filterItem),
                            padding: viewManager.layoutData.singleNodeLayoutData.nodesInterPadding
                        )
                    )
                    .pressEffect {
                        filterItem.onFilterSelection.send(filterItem.id)
                    }
                }
            }
            .padding(viewManager.layoutData.containerLayoutData.wrapperPadding)
        })
    }
}
