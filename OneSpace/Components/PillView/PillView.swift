//
//  PillView.swift
//  OneSpace
//
//  Created by Aditya Raj on 10/08/25.
//

import Foundation
import SwiftUI

// MARK: - PillViewData
/// A data structure that holds all the styling and content configuration
/// for rendering a pill-shaped view with text, optional background, and borders.
struct PillViewData {
    
    // MARK: - BorderData
    /// Nested struct that defines the appearance of a border for the pill.
    struct BorderData {
        /// The border line width in points.
        let width: CGFloat
        /// The color of the border.
        let widthColor: Color
        
        /// Creates a new BorderData instance.
        /// - Parameters:
        ///   - width: Thickness of the border (in points).
        ///   - widthColor: Color of the border line.
        init(width: CGFloat, widthColor: Color) {
            self.width = width
            self.widthColor = widthColor
        }
    }
    
    /// The text displayed inside the pill.
    let text: String
    
    /// Optional color for the text.
    /// - If `nil`, the color will be taken from the theme’s primary color.
    let textColor: Color?
    
    /// The font used for the pill text.
    let font: Font
    
    /// Optional border styling.
    /// - If `nil`, no border will be drawn.
    let borderData: BorderData?
    
    /// Corner radius of the pill (controls how rounded it appears).
    let cornerRadius: CGFloat
    
    /// Optional background fill color inside the pill.
    /// - If `nil`, theme’s primary color will be used.
    let backgroundColor: Color?
    
    /// Padding applied between the text and the pill’s border.
    let padding: EdgeInsets
    
    /// Creates a new PillViewData instance with configurable styling.
    /// - Parameters:
    ///   - text: The text to display inside the pill.
    ///   - textColor: Optional text color. Defaults to `nil` (theme color is used).
    ///   - font: The font of the text.
    ///   - borderData: Optional border styling. Defaults to `nil` (no border).
    ///   - cornerRadius: Corner radius for the shape.
    ///   - backgroundColor: Optional background fill color. Defaults to `nil`.
    ///   - padding: Padding around the text inside the pill.
    init(
        text: String,
        textColor: Color?,
        font: Font,
        borderData: BorderData? = nil,
        cornerRadius: CGFloat,
        backgroundColor: Color? = nil,
        padding: EdgeInsets
    ) {
        self.text = text
        self.textColor = textColor
        self.font = font
        self.borderData = borderData
        self.cornerRadius = cornerRadius
        self.backgroundColor = backgroundColor
        self.padding = padding
    }
}

// MARK: - PillView
/// A SwiftUI view representing a stylized, pill-shaped label.
/// Displays text with customizable colors, font, padding, background, and optional border.
/// Falls back to theme colors if specific colors are not provided.
struct PillView: View {
    
    /// ThemeManager injected via Environment, providing global theme colors and settings.
    @EnvironmentObject var themeManager: ThemeManager
    
    /// Styling and content configuration for this pill.
    private let data: PillViewData
    
    /// Creates a new PillView with the given configuration data.
    /// - Parameter data: `PillViewData` describing how the pill should look.
    init(data: PillViewData) {
        self.data = data
    }
    
    var body: some View {
        Text(data.text)
            // Use provided text color or fallback to theme primary color
            .foregroundStyle(data.textColor ?? themeManager.theme.primary)
            .font(data.font)
            .padding(data.padding)
            // Fill the background fully with the specified or theme color
            .background(
                RoundedRectangle(cornerRadius: data.cornerRadius)
                    .fill(data.backgroundColor ?? themeManager.theme.background)
            )
            // Draw optional border on top of the filled background
            .overlay(
                RoundedRectangle(cornerRadius: data.cornerRadius)
                    .stroke(
                        data.borderData?.widthColor ?? .clear,
                        lineWidth: data.borderData?.width ?? 0
                    )
            )
    }
}
