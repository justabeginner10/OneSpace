//
//  OneSpaceApp.swift
//  OneSpace
//
//  Created by Aditya Raj on 03/08/25.
//

import SwiftUI
import SwiftData

@main
struct OneSpaceApp: App {
    @StateObject private var themeManager = ThemeManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(themeManager)
        }
    }
}
