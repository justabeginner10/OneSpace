//
//  FontProviderUtil.swift
//  OneSpace
//
//  Created by Aditya Raj on 03/08/25.
//

import Foundation
import SwiftUI

/// Represents all the available font variants of the MuseoModerno font family.
///
/// Each case corresponds to a specific PostScript name of the font file added to the project.
/// Use these enum cases to refer to fonts in a type-safe and clear manner throughout the app.
///
enum MuseoModernoStyle: String {
    case thin = "MuseoModerno-Thin"
    case thinItalic = "MuseoModerno-ThinItalic"
    case extraLight = "MuseoModerno-ExtraLight"
    case extraLightItalic = "MuseoModerno-ExtraLightItalic"
    case light = "MuseoModerno-Light"
    case lightItalic = "MuseoModerno-LightItalic"
    case regular = "MuseoModerno-Regular"
    case italic = "MuseoModerno-Italic"
    case medium = "MuseoModerno-Medium"
    case mediumItalic = "MuseoModerno-MediumItalic"
    case semiBold = "MuseoModerno-SemiBold"
    case semiBoldItalic = "MuseoModerno-SemiBoldItalic"
    case bold = "MuseoModerno-Bold"
    case boldItalic = "MuseoModerno-BoldItalic"
    case extraBold = "MuseoModerno-ExtraBold"
    case extraBoldItalic = "MuseoModerno-ExtraBoldItalic"
    case black = "MuseoModerno-Black"
    case blackItalic = "MuseoModerno-BlackItalic"
}

extension Font {
    
    /// Returns a custom MuseoModerno font of a specified style and size.
    ///
    /// - Parameters:
    ///   - style: The MuseoModernoStyle enum case representing the font variant.
    ///   - size: The desired font size.
    /// - Returns: A SwiftUI `Font` initialized with the specified MuseoModerno variant and size.
    ///
    /// Example:
    /// ```
    /// Text("Hello")
    ///     .font(.museoModerno(.regular, size: 16))
    /// ```
    static func museoModerno(_ style: MuseoModernoStyle, size: CGFloat) -> Font {
        .custom(style.rawValue, size: size)
    }
    
    // MARK: - Shorthand Accessors
    
    /// The following static vars provide convenient shorthand access to MuseoModerno font variants.
    ///
    /// Each returns a `MuseoModernoFontProxy` instance initialized with a specific style.
    /// Thanks to the `callAsFunction` implementation in `MuseoModernoFontProxy`, you can use these like:
    ///
    /// ```
    /// Text("Museo Thin")
    ///     .font(.museoModernoThin(12))
    /// ```
    ///
    /// This enhances code readability, autocompletion, and type safety.
    
    static var museoModernoThin: MuseoModernoFontProxy { .init(style: .thin) }
    static var museoModernoThinItalic: MuseoModernoFontProxy { .init(style: .thinItalic) }
    static var museoModernoExtraLight: MuseoModernoFontProxy { .init(style: .extraLight) }
    static var museoModernoExtraLightItalic: MuseoModernoFontProxy { .init(style: .extraLightItalic) }
    static var museoModernoLight: MuseoModernoFontProxy { .init(style: .light) }
    static var museoModernoLightItalic: MuseoModernoFontProxy { .init(style: .lightItalic) }
    static var museoModernoRegular: MuseoModernoFontProxy { .init(style: .regular) }
    static var museoModernoItalic: MuseoModernoFontProxy { .init(style: .italic) }
    static var museoModernoMedium: MuseoModernoFontProxy { .init(style: .medium) }
    static var museoModernoMediumItalic: MuseoModernoFontProxy { .init(style: .mediumItalic) }
    static var museoModernoSemiBold: MuseoModernoFontProxy { .init(style: .semiBold) }
    static var museoModernoSemiBoldItalic: MuseoModernoFontProxy { .init(style: .semiBoldItalic) }
    static var museoModernoBold: MuseoModernoFontProxy { .init(style: .bold) }
    static var museoModernoBoldItalic: MuseoModernoFontProxy { .init(style: .boldItalic) }
    static var museoModernoExtraBold: MuseoModernoFontProxy { .init(style: .extraBold) }
    static var museoModernoExtraBoldItalic: MuseoModernoFontProxy { .init(style: .extraBoldItalic) }
    static var museoModernoBlack: MuseoModernoFontProxy { .init(style: .black) }
    static var museoModernoBlackItalic: MuseoModernoFontProxy { .init(style: .blackItalic) }
    
    /// A proxy type that allows the shorthand computed properties to behave like functions,
    /// enabling a clean syntax to specify the font size when using shorthand fonts.
    ///
    /// Behind the scenes, calling the proxy with `size` invokes the internal `callAsFunction` method,
    /// which returns a SwiftUI `Font` instance with the exact font variant and size.
    ///
    /// Example:
    /// ```
    /// Text("Sample")
    ///     .font(.museoModernoThin(14)) // Calls MuseoModernoFontProxy.callAsFunction(14)
    /// ```
    struct MuseoModernoFontProxy {
        /// The MuseoModerno font style represented by this proxy.
        let style: MuseoModernoStyle
        
        /// Enables the instance to be called like a function with a font size parameter.
        ///
        /// - Parameter size: The font size to create.
        /// - Returns: A SwiftUI `Font` instance with the specified MuseoModerno style and size.
        func callAsFunction(_ size: CGFloat) -> Font {
            Font.custom(style.rawValue, size: size)
        }
    }
}
