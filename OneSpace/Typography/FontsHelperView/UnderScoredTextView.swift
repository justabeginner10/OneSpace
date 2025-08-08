//
//  UnderScoredTextView.swift
//  OneSpace
//
//  Created by Aditya Raj on 09/08/25.
//

import SwiftUI

/// A view that displays a string with a colored underscore at the end,
/// customizable for text, text color, underscore color, and font.
///
/// Usage:
///     TypeText("OneSpace", textColor: .white, underscoreColor: .red, font: .museoModernoBold(36))
struct UnderScoredTextView: View {
    private let text: String
    private let textColor: Color
    private let underscoreColor: Color
    private let font: Font

    init(
        text: String,
        textColor: Color,
        underscoreColor: Color,
        font: Font
    ) {
        self.text = text
        self.textColor = textColor
        self.underscoreColor = underscoreColor
        self.font = font
    }
    
    var body: some View {
        HStack(alignment: .lastTextBaseline, spacing: 0) {
            Text(text)
                .foregroundColor(textColor)
                .font(font)
            Text("_")
                .foregroundColor(underscoreColor)
                .font(font)
        }
    }
}
