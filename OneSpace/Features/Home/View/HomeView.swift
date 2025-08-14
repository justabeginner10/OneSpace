//
//  HomeView.swift
//  OneSpace
//
//  Created by Aditya Raj on 09/08/25.
//

import Foundation
import SwiftUI
import Combine

struct HomeView: View {
    @EnvironmentObject var themeManager: ThemeManager
    
    @StateObject private var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            if let filterManager = viewModel.filterManager {
                FilterView(viewManager: filterManager)
            }
        }
    }
}


class HomeViewModel: ObservableObject {
    private var themeManager: ThemeManager
    var updateSubject: PassthroughSubject<String, Never> = .init()
    var cancellable: Set<AnyCancellable> = .init()
    @Published var filterManager: FilterManager?
    
    init(themeManager: ThemeManager) {
        self.themeManager = themeManager
        self.filterManager = FilterManager(
            filterData: createFilterData(),
            layoutData: .init(
                containerLayoutData: .init(
                    nodesInterspacing: 8,
                    wrapperPadding: .init(top: 4, leading: 4, bottom: 4, trailing: 4)
                ),
                singleNodeLayoutData: .init(
                    nodesCornerRadius: 20,
                    nodesInterPadding: .init(top: 6, leading: 12, bottom: 6, trailing: 12)
                )
            )
        )
        bindToEventListeners()
    }
    
    func createFilterData() -> [FilterData] {
        return [
            FilterData(
                isSelected: false,
                selectedText: "First",
                selectedFont: .museoModerno(.regular, size: 16),
                selectedTextColor: themeManager.theme.background,
                unselectedTextColor: themeManager.theme.accentRed,
                selectedBackgroundColor: themeManager.theme.accentRed,
                unselectedBackgroundColor: .clear,
                borderWidth: 2,
                selectedBorderColor: themeManager.theme.accentRed,
                onFilterSelection: updateSubject
            ),
            FilterData(
                isSelected: false,
                selectedText: "Second",
                selectedFont: .museoModerno(.regular, size: 16),
                selectedTextColor: themeManager.theme.background,
                unselectedTextColor: themeManager.theme.accentRed,
                selectedBackgroundColor: themeManager.theme.accentRed,
                unselectedBackgroundColor: .clear,
                borderWidth: 2,
                selectedBorderColor: themeManager.theme.accentRed,
                onFilterSelection: updateSubject
            ),
            FilterData(
                isSelected: false,
                selectedText: "Third",
                selectedFont: .museoModerno(.regular, size: 16),
                selectedTextColor: themeManager.theme.background,
                unselectedTextColor: themeManager.theme.accentRed,
                selectedBackgroundColor: themeManager.theme.accentRed,
                unselectedBackgroundColor: .clear,
                borderWidth: 2,
                selectedBorderColor: themeManager.theme.accentRed,
                onFilterSelection: updateSubject
            ),
            FilterData(
                isSelected: false,
                selectedText: "Fourth",
                selectedFont: .museoModerno(.regular, size: 16),
                selectedTextColor: themeManager.theme.background,
                unselectedTextColor: themeManager.theme.accentRed,
                selectedBackgroundColor: themeManager.theme.accentRed,
                unselectedBackgroundColor: .clear,
                borderWidth: 2,
                selectedBorderColor: themeManager.theme.accentRed,
                onFilterSelection: updateSubject
            ),
            FilterData(
                isSelected: false,
                selectedText: "Fifth",
                selectedFont: .museoModerno(.regular, size: 16),
                selectedTextColor: themeManager.theme.background,
                unselectedTextColor: themeManager.theme.accentRed,
                selectedBackgroundColor: themeManager.theme.accentRed,
                unselectedBackgroundColor: .clear,
                borderWidth: 2,
                selectedBorderColor: themeManager.theme.accentRed,
                onFilterSelection: updateSubject
            ),
            FilterData(
                isSelected: false,
                selectedText: "Sixth",
                selectedFont: .museoModerno(.regular, size: 16),
                selectedTextColor: themeManager.theme.background,
                unselectedTextColor: themeManager.theme.accentRed,
                selectedBackgroundColor: themeManager.theme.accentRed,
                unselectedBackgroundColor: .clear,
                borderWidth: 2,
                selectedBorderColor: themeManager.theme.accentRed,
                onFilterSelection: updateSubject
            ),
            FilterData(
                isSelected: false,
                selectedText: "Seventh",
                selectedFont: .museoModerno(.regular, size: 16),
                selectedTextColor: themeManager.theme.background,
                unselectedTextColor: themeManager.theme.accentRed,
                selectedBackgroundColor: themeManager.theme.accentRed,
                unselectedBackgroundColor: .clear,
                borderWidth: 2,
                selectedBorderColor: themeManager.theme.accentRed,
                onFilterSelection: updateSubject
            ),
            FilterData(
                isSelected: false,
                selectedText: "Eighth",
                selectedFont: .museoModerno(.regular, size: 16),
                selectedTextColor: themeManager.theme.background,
                unselectedTextColor: themeManager.theme.accentRed,
                selectedBackgroundColor: themeManager.theme.accentRed,
                unselectedBackgroundColor: .clear,
                borderWidth: 2,
                selectedBorderColor: themeManager.theme.accentRed,
                onFilterSelection: updateSubject
            ),
            FilterData(
                isSelected: false,
                selectedText: "Ninth",
                selectedFont: .museoModerno(.regular, size: 16),
                selectedTextColor: themeManager.theme.background,
                unselectedTextColor: themeManager.theme.accentRed,
                selectedBackgroundColor: themeManager.theme.accentRed,
                unselectedBackgroundColor: .clear,
                borderWidth: 2,
                selectedBorderColor: themeManager.theme.accentRed,
                onFilterSelection: updateSubject
            ),
            FilterData(
                isSelected: false,
                selectedText: "Tenth",
                selectedFont: .museoModerno(.regular, size: 16),
                selectedTextColor: themeManager.theme.background,
                unselectedTextColor: themeManager.theme.accentRed,
                selectedBackgroundColor: themeManager.theme.accentRed,
                unselectedBackgroundColor: .clear,
                borderWidth: 2,
                selectedBorderColor: themeManager.theme.accentRed,
                onFilterSelection: updateSubject
            )
        ]
    }
    
    func bindToEventListeners() {
        updateSubject
            .receive(on: DispatchQueue.main)
            .sink { [weak self] id in
                self?.updateDataFor(id: id)
            }
            .store(in: &cancellable)
    }
    
    private func updateDataFor(id: String) {
        if let index = self.filterManager?.filterData.firstIndex(where: { $0.id == id }) {
            filterManager?.filterData[index].isSelected.toggle()
        }
    }
}
