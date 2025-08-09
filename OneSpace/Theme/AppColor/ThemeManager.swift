//
//  ThemeManager.swift
//  OneSpace
//
//  Created by Aditya Raj on 09/08/25.
//

import SwiftUI

/// An observable class that provides the current app-wide theme.
///
/// `ThemeManager` centralizes control over which color theme is active,
/// making it simple to inject and reactively switch themes (e.g., Light or Dark)
/// across your view hierarchy. Designed to be provided as an `@EnvironmentObject`
/// at the root of your SwiftUI hierarchy, enabling dynamic theme updates.
///
/// Usage example (injecting):
///     @StateObject private var themeManager = ThemeManager()
///     ContentView().environmentObject(themeManager)
///
/// Usage example (consuming colors in any view):
///     @EnvironmentObject var themeManager: ThemeManager
///     .foregroundColor(themeManager.theme.primary)
///
final class ThemeManager: ObservableObject {
    /// The currently active theme, published for automatic view updates.
    ///
    /// Set to `LightAppTheme` by default; assign any theme that conforms to `AppThemeProtocol`.
    @Published var theme: AppThemeProtocol = DarkAppTheme()
    
    /// Switches the active theme to Light.
    ///
    /// Call this to set all theme colors to the light palette.
    func switchToLight() {
        theme = LightAppTheme()
    }
    
    /// Switches the active theme to Dark.
    ///
    /// Call this to set all theme colors to the dark palette.
    func switchToDark() {
        theme = DarkAppTheme()
    }
    
    // Extend with custom themes or persistence as needed.
}
