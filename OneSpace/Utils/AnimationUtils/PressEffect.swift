//
//  PressEffect.swift
//  OneSpace
//
//  Created by Aditya Raj on 12/08/25.
//

import Foundation
import SwiftUI

// MARK: - PressEffect
/// A `ViewModifier` that provides a tactile "press down" animation effect
/// to any view, similar to how system buttons visually depress while pressed.
/// It also allows you to specify an **action (via `onCompletion`)** that runs
/// when the press gesture completes (finger lifted).
///
/// ## How it works
/// - Uses a continuous `DragGesture` with `minimumDistance = 0` so it responds
///   immediately to touch down.
/// - Leverages `@GestureState` so the `isPressed` state automatically resets
///   when the gesture ends.
/// - Applies a `.scaleEffect` to slightly shrink the view while pressed.
/// - Animates the scaling using `.bouncy` for a springy, natural feel.
/// - Executes the `onCompletion` closure **when the press ends** (after touch release).
///
/// ## Example usage:
/// ```
/// Text("Tap Me")
///     .padding()
///     .background(Color.blue, in: Capsule())
///     .foregroundColor(.white)
///     .pressEffect {
///         print("Button tapped or pressed and released!")
///     }
/// ```
///
/// You can also use it with any custom view:
/// ```
/// PillView(data: pillData)
///     .pressEffect {
///         playHapticFeedback()
///         navigateToDetails()
///     }
/// ```
struct PressEffect: ViewModifier {
    
    /// Tracks whether the view is currently being pressed.
    /// Using `@GestureState` ensures this value automatically returns to `false`
    /// when the gesture ends without manual reset.
    @GestureState private var isPressed = false
    
    /// Action to perform when the press gesture is completed (finger lifted).
    let onCompletion: (() -> Void)
    
    func body(content: Content) -> some View {
        content
            .scaleEffect(isPressed ? 0.9 : 1.0)
            .animation(.bouncy(duration: 0.4, extraBounce: 0.4), value: isPressed)
            .gesture(
                DragGesture(minimumDistance: 0)
                    .updating($isPressed) { _, state, _ in
                        state = true
                    }
                    .onEnded { _ in
                        onCompletion()
                    }
            )
    }
}

// MARK: - View Extension
extension View {
    /// Applies the `PressEffect` modifier to the view,
    /// giving it a press-down scaling animation similar to system buttons.
    /// - Parameter onCompletion: Closure to run when the press ends.
    /// - Returns: A view with the press effect applied.
    func pressEffect(onCompletion: @escaping (() -> Void)) -> some View {
        self.modifier(PressEffect(onCompletion: onCompletion))
    }
}
