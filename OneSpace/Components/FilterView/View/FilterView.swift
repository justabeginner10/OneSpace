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
    @ObservedObject private var viewManager: FilterManager
    @State private var animateFilters = false
    
    init(viewManager: FilterManager) {
        self.viewManager = viewManager
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            LazyHStack(spacing: viewManager.layoutData.containerLayoutData.nodesInterspacing) {
                ForEach(Array(viewManager.filterData.enumerated()), id: \.element.id) { index, filterItem in
                    PillView(
                        data: .init(
                            text: viewManager.getText(for: index),
                            textColor: viewManager.getTextColor(for: index),
                            font: viewManager.getFont(for: index),
                            borderData: .init(width: filterItem.borderWidth,
                                              widthColor: viewManager.getBorderColor(for: index)),
                            cornerRadius: viewManager.layoutData.singleNodeLayoutData.nodesCornerRadius,
                            backgroundColor: viewManager.getBackgroundColor(for: index),
                            padding: viewManager.layoutData.singleNodeLayoutData.nodesInterPadding
                        )
                    )
                    .pressEffect {
                        filterItem.onFilterSelection.send(filterItem.id)
                    }
                    .offset(x: animateFilters ? 0 : UIScreen.main.bounds.width)
                    .opacity(animateFilters ? 1 : 0)
                    .animation(
                        .spring(duration: 0.6, bounce:0.2)
                        .delay(Double(index) * 0.1),
                        value: animateFilters
                    )
                }
            }
            .padding(viewManager.layoutData.containerLayoutData.wrapperPadding)
        })
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                animateFilters = true
            }
        }
    }
}
