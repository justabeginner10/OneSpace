//
//  PressEffect.swift
//  OneSpace
//
//  Created by Aditya Raj on 12/08/25.
//

import Foundation
import SwiftUI

//  A reusable SwiftUI ViewModifier that provides a "press down" tactile
//  animation effect to any view, similar to how system buttons visually
//  depress while being pressed.
//
//  Use `.pressEffect()` on any view to apply this animation.
//

// MARK: - PressEffect
/// A `ViewModifier` that scales a view down while it is being pressed,
/// simulating a button-press or "depressed" effect.
///
/// This modifier:
/// - Uses a continuous `DragGesture` with `minimumDistance = 0`
///   so it responds immediately to touch-down without requiring movement.
/// - Relies on `@GestureState` so the "pressed" state automatically
///   resets when the gesture ends.
/// - Applies a `.scaleEffect` to shrink the view slightly while pressed.
/// - Animates the scaling using `.bouncy` for a springy, natural feel.
///
/// Example usage:
/// ```
/// Text("Tap Me")
///     .padding()
///     .background(Color.blue, in: Capsule())
///     .foregroundColor(.white)
///     .pressEffect()
/// ```
///
/// You can also use it with custom views:
/// ```
/// PillView(data: pillData)
///     .pressEffect()
/// ```
struct PressEffect: ViewModifier {
    
    /// Tracks whether the view is currently being pressed.
    /// Using `@GestureState` ensures this value automatically returns to `false`
    /// when the gesture ends without manual reset.
    @GestureState private var isPressed = false
    
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
                    .onEnded({ _ in
                        onCompletion()
                    })
            )
    }
}

// MARK: - View Extension
extension View {
    /// Applies the `PressEffect` modifier to the view,
    /// giving it a press-down scaling animation similar to system buttons.
    func pressEffect(onCompletion: @escaping (() -> Void)) -> some View {
        self.modifier(PressEffect(onCompletion: onCompletion))
    }
}
