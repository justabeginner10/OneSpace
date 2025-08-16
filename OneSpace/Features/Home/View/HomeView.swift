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
    
    @State private var animateHeader: Bool = false
    @State private var animateContent: Bool = false
    
    init(viewModel: HomeViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ZStack {
            themeManager.theme.background
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                LazyVStack(spacing: 16, pinnedViews: [.sectionHeaders]) {
                    UnderScoredTextView(
                        text: "task",
                        textColor: themeManager.theme.primary,
                        underscoreColor: themeManager.theme.accentRed,
                        font: .museoModerno(.bold, size: 50)
                    )
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)
                    .offset(y: animateHeader ? 0 : -100)
                    .opacity(animateHeader ? 1 : 0)
                    .animation(.spring(duration: 0.6, bounce: 0.4), value: animateHeader)
                    
                    Section {
                        ForEach(0...20, id: \.self) { index in
                            if index % 3 == 0 {
                                FilterDividerView()
                            }
                            
                            CardsView()
                        }
                        .padding(.horizontal, 16)
                        .offset(y: animateContent ? 0 : UIScreen.main.bounds.height)
                        .opacity(animateContent ? 1 : 0)
                        .animation(.spring(duration: 0.6, bounce: 0.2), value: animateContent)
                    } header: {
                        if let filterManager = viewModel.filterManager {
                            FilterView(viewManager: filterManager)
                                .background {
                                    themeManager.theme.background
                                }
                        }
                    }
                }
            }
            .edgesIgnoringSafeArea(.top)
            .padding(.top)
            .safeAreaInset(edge: .top) {
                Color.clear.frame(height: 0)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                animateHeader = true
                animateContent = true
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
                    wrapperPadding: .init(top: 12, leading: 16, bottom: 12, trailing: 16)
                ),
                singleNodeLayoutData: .init(
                    nodesCornerRadius: 20,
                    nodesInterPadding: .init(top: 6, leading: 12, bottom: 6, trailing: 12)
                )
            )
        )
        bindToEventListeners()
    }
    
    // TODO: To remove when proper data setup is doneyVa
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
        guard var data = filterManager?.filterData else { return }
        if let index = data.firstIndex(where: { $0.id == id }) {
            data[index].isSelected.toggle()
            filterManager?.filterData = data
        }
    }
}
