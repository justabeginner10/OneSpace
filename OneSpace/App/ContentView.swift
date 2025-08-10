//
//  ContentView.swift
//  OneSpace
//
//  Created by Aditya Raj on 03/08/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @EnvironmentObject var themeManager: ThemeManager
    @State private var isActive: Bool = false
    
    var body: some View {
        VStack(spacing: 12) {
            if isActive {
                HomePageView()
            } else {
                SplashScreenView()
            }
            
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                isActive = true
            }
        }
    }
}
