//
//  Tokens.swift
//  OneSpace
//
//  Created by Aditya Raj on 11/08/25.
//

import Foundation
import SwiftUI

enum Tokens {
    enum Spacing: CGFloat {
        case xxxSmall = 2
        case xxSmall = 4
        case xSmall = 8
        case small = 12
        case medium = 16
        case large = 20
        case xLarge = 24
        case xxLarge = 32
        
        var value: CGFloat {
            rawValue
        }
    }
}
