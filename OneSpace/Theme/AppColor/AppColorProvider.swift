//
//  AppTheme.swift
//  OneSpace
//
//  Created by Aditya Raj on 03/08/25.
//

import SwiftUI

/// A protocol describing the color palette for an app-wide theme.
///
/// Conform each theme (light, dark, etc) to this protocol by providing
/// specific color values. Access colors by name for consistent UI styling.
///
/// Usage:
///     let theme: AppThemeProtocol = LightAppTheme()
///     theme.primary // App's main foreground color
///
protocol AppThemeProtocol {
    /// Main foreground color (e.g., for text, icons)
    var primary: Color { get }
    /// Base background color for screens and containers
    var background: Color { get }
    /// Alternate background (softer than regular background)
    var backgroundSoft: Color { get }
    /// Teal accent color, e.g. actions or highlights
    var accentTeal: Color { get }
    /// Purple accent color, e.g. actions or highlights
    var accentPurple: Color { get }
    /// Lime accent color, e.g. for success or highlights
    var accentLime: Color { get }
    /// Light blue, typically for secondary backgrounds or cards
    var backgroundLightBlue: Color { get }
    /// Lavender, typically for secondary backgrounds or cards
    var backgroundLavender: Color { get }
    /// Pink accent, e.g. error, badge, highlight
    var accentPink: Color { get }
    /// Orange accent, e.g. warnings or highlights
    var accentOrange: Color { get }
    /// Light pink background, e.g. playful accent, banner, or tag
    var backgroundLightPink: Color { get }
    /// Red background
    var accentRed: Color { get }
}

/// Concrete theme colors for Light Mode.
///
/// Assigns all color values using hex notation via custom Color initializer.
/// Conforms to `AppThemeProtocol`, so you can access colors by semantic names.
///
/// Usage:
///     let theme = LightAppTheme()
///     theme.background // returns white
///
struct LightAppTheme: AppThemeProtocol {
    let primary = Color(hex: "000000")
    let background = Color(hex: "FFFFFF")
    let backgroundSoft = Color(hex: "FFFFE3")
    let accentTeal = Color(hex: "6CBCBF")
    let accentPurple = Color(hex: "B474A1")
    let accentLime = Color(hex: "CBE54E")
    let backgroundLightBlue = Color(hex: "D9ECF2")
    let backgroundLavender = Color(hex: "DBD4FF")
    let accentPink = Color(hex: "EF4668")
    let accentOrange = Color(hex: "F9AD6A")
    let backgroundLightPink = Color(hex: "FFBAC6")
    let accentRed = Color(hex: "FF857A")
}

/// Concrete theme colors for Dark Mode.
///
/// Assigns all color values using hex notation via custom Color initializer.
/// Designed for visual comfort in dark environments, with high contrast and vivid accents.
///
/// Usage:
///     let theme = DarkAppTheme()
///     theme.background // returns black
///
struct DarkAppTheme: AppThemeProtocol {
    let primary = Color(hex: "FFFFFF")
    let background = Color(hex: "000000")
    let backgroundSoft = Color(hex: "222222")
    let accentTeal = Color(hex: "6CBCBF")
    let accentPurple = Color(hex: "B474A1")
    let accentLime = Color(hex: "CBE54E")
    let backgroundLightBlue = Color(hex: "1A2832")
    let backgroundLavender = Color(hex: "2F2040")
    let accentPink = Color(hex: "EF4668")
    let accentOrange = Color(hex: "F9AD6A")
    let backgroundLightPink = Color(hex: "FFBAC6")
    let accentRed = Color(hex: "FF857A")
}

extension Color {
    /// Initializes a Color from a hex string in common RGB or ARGB notation.
    ///
    /// Supports 6-character `"RRGGBB"` or 8-character `"AARRGGBB"` formats.
    /// Invalid formats return opaque black by default.
    ///
    /// Examples:
    ///     Color(hex: "FFFFFF") // white
    ///     Color(hex: "000000") // black
    ///
    /// - Parameter hex: A string containing hex digits, case insensitive.
    /// - Returns: A SwiftUI Color representing the specified hex value.
    ///
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, (int >> 16) & 0xFF, (int >> 8) & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = ((int >> 24) & 0xFF, (int >> 16) & 0xFF, (int >> 8) & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
