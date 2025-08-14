//
//  FilterManager.swift
//  OneSpace
//
//  Created by Aditya Raj on 14/08/25.
//

import Foundation
import SwiftUI
import Combine

class FilterManager: ObservableObject {
    @Published var filterData: [FilterData] = []
    private(set) var layoutData: FilterLayoutData
    
    init(filterData: [FilterData], layoutData: FilterLayoutData) {
        self.filterData = filterData
        self.layoutData = layoutData
    }
    
    // MARK: - Generic Helper
    private func valueFor<T>(
        index: Int,
        selectedKey: KeyPath<FilterData, T>,
        unselectedKey: KeyPath<FilterData, T?>
    ) -> T where T: Equatable {
        guard index < filterData.count else {
            fatalError("Index out of range in FilterManager")
        }
        let item = filterData[index]
        if let unselectedValue = item[keyPath: unselectedKey] {
            return item.isSelected ? item[keyPath: selectedKey] : unselectedValue
        }
        return item[keyPath: selectedKey]
    }
    
    // MARK: - Public Accessors
    
    func getText(for index: Int) -> String {
        valueFor(index: index, selectedKey: \.selectedText, unselectedKey: \.unselectedText)
    }
    
    func getFont(for index: Int) -> Font {
        valueFor(index: index, selectedKey: \.selectedFont, unselectedKey: \.unselectedFont)
    }
    
    func getTextColor(for index: Int) -> Color {
        valueFor(index: index, selectedKey: \.selectedTextColor, unselectedKey: \.unselectedTextColor)
    }
    
    func getBackgroundColor(for index: Int) -> Color {
        valueFor(index: index, selectedKey: \.selectedBackgroundColor, unselectedKey: \.unselectedBackgroundColor)
    }
    
    func getBorderColor(for index: Int) -> Color {
        valueFor(index: index, selectedKey: \.selectedBorderColor, unselectedKey: \.unselectedBorderColor)
    }
    
    func getBorderWidth(for index: Int) -> CGFloat {
        filterData[index].borderWidth
    }
    
    // MARK: - Direct FilterData Accessors
    
    func getText(for filterItem: FilterData) -> String {
        if let unselectedText = filterItem.unselectedText {
            return filterItem.isSelected ? filterItem.selectedText : unselectedText
        }
        return filterItem.selectedText
    }
    
    func getFont(for filterItem: FilterData) -> Font {
        if let unselectedFont = filterItem.unselectedFont {
            return filterItem.isSelected ? filterItem.selectedFont : unselectedFont
        }
        return filterItem.selectedFont
    }
    
    func getTextColor(for filterItem: FilterData) -> Color {
        if let unselectedTextColor = filterItem.unselectedTextColor {
            return filterItem.isSelected ? filterItem.selectedTextColor : unselectedTextColor
        }
        return filterItem.selectedTextColor
    }
    
    func getBackgroundColor(for filterItem: FilterData) -> Color {
        if let unselectedBackgroundColor = filterItem.unselectedBackgroundColor {
            return filterItem.isSelected ? filterItem.selectedBackgroundColor : unselectedBackgroundColor
        }
        return filterItem.selectedBackgroundColor
    }
    
    func getBorderColor(for filterItem: FilterData) -> Color {
        if let unselectedBorderColor = filterItem.unselectedBorderColor {
            return filterItem.isSelected ? filterItem.selectedBorderColor : unselectedBorderColor
        }
        return filterItem.selectedBorderColor
    }
}

struct FilterData {
    let id: String
    var isSelected: Bool
    let selectedText: String
    let unselectedText: String?
    let selectedFont: Font
    let unselectedFont: Font?
    let selectedTextColor: Color
    let unselectedTextColor: Color?
    let selectedBackgroundColor: Color
    let unselectedBackgroundColor: Color?
    let borderWidth: CGFloat
    let selectedBorderColor: Color
    let unselectedBorderColor: Color?
    let onFilterSelection: PassthroughSubject<String, Never>
    
    init(
        isSelected: Bool,
        selectedText: String,
        unselectedText: String? = nil,
        selectedFont: Font,
        unselectedFont: Font? = nil,
        selectedTextColor: Color,
        unselectedTextColor: Color? = nil,
        selectedBackgroundColor: Color,
        unselectedBackgroundColor: Color? = nil,
        borderWidth: CGFloat,
        selectedBorderColor: Color,
        unselectedBorderColor: Color? = nil,
        onFilterSelection: PassthroughSubject<String, Never>
    ) {
        self.id = UUID().uuidString
        self.isSelected = isSelected
        self.selectedText = selectedText
        self.unselectedText = unselectedText
        self.selectedFont = selectedFont
        self.unselectedFont = unselectedFont
        self.selectedTextColor = selectedTextColor
        self.unselectedTextColor = unselectedTextColor
        self.selectedBackgroundColor = selectedBackgroundColor
        self.unselectedBackgroundColor = unselectedBackgroundColor
        self.borderWidth = borderWidth
        self.selectedBorderColor = selectedBorderColor
        self.unselectedBorderColor = unselectedBorderColor
        self.onFilterSelection = onFilterSelection
    }
}

struct FilterLayoutData {
    struct FilterContainerLayoutData {
        let nodesInterspacing: CGFloat
        let wrapperPadding: EdgeInsets
    }
    
    struct SingleFilterNodeLayoutData {
        let nodesCornerRadius: CGFloat
        let nodesInterPadding: EdgeInsets
    }
    
    let containerLayoutData: FilterContainerLayoutData
    let singleNodeLayoutData: SingleFilterNodeLayoutData
    
    init(containerLayoutData: FilterContainerLayoutData, singleNodeLayoutData: SingleFilterNodeLayoutData) {
        self.containerLayoutData = containerLayoutData
        self.singleNodeLayoutData = singleNodeLayoutData
    }
}
