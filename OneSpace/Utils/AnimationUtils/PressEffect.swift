//
//  PressEffect.swift
//  OneSpace
//
//  Created by Aditya Raj on 12/08/25.
//

import Foundation
import SwiftUI

// MARK: - PressEffect
/// A `ViewModifier` that applies a tactile **"press down" scaling animation**
/// to a view, similar to system buttons visually depressing when touched.
///
/// - Provides visual feedback by shrinking the view while pressed.
/// - Executes an optional `onCompletion` closure **only on taps** (not during scrolling).
///
/// ### How it works:
/// 1. Uses a `DragGesture` with `minimumDistance = 0` to detect press state.
/// 2. Tracks drag distance to distinguish between **tap** and **scroll**.
/// 3. Uses `@GestureState` so `isPressed` resets automatically when the gesture ends.
/// 4. Applies `.scaleEffect` + `.bouncy` animation for a natural springy feel.
/// 5. Calls `onCompletion()` only if it’s a **short, stationary press**.
///
/// ### Example usage:
/// ```
/// Text("Tap Me")
///     .padding()
///     .background(Color.blue, in: Capsule())
///     .foregroundColor(.white)
///     .pressEffect {
///         print("Tapped!")
///     }
///
/// CustomView()
///     .pressEffect {
///         hapticFeedback()
///         navigateToDetails()
///     }
/// ```
struct PressEffect: ViewModifier {
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    /// Whether the view is currently being pressed.
    /// Automatically resets via `@GestureState` when gesture ends.
    @GestureState private var isPressed = false
    
    /// Tracks if the movement looks like scrolling to avoid false taps.
    @State private var wasScrolled = false
    
    /// Action performed when the press completes (on finger lift).
    let onCompletion: () -> Void
    
    func body(content: Content) -> some View {
        content
            // Scale down when pressed
            .scaleEffect(isPressed ? 0.9 : 1.0)
            .animation(reduceMotion ? nil : .bouncy(duration: 0.4, extraBounce: 0.4), value: isPressed)
            // Handle press detection
            .simultaneousGesture(
                DragGesture(minimumDistance: 0)
                    // Mark as pressed (for scaling) while finger is down
                    .updating($isPressed) { _, state, _ in
                        state = true
                    }
                    .onChanged { value in
                        // Consider it a scroll if movement exceeds 10 points in any direction
                        if abs(value.translation.width) > 10 || abs(value.translation.height) > 10 {
                            wasScrolled = true
                        }
                    }
                    .onEnded { value in
                        // Distance from start to end point
                        let xVal = value.translation.width
                        let yVal = value.translation.height
                        let totalDistance = (xVal * xVal + yVal * yVal).squareRoot()
                        
                        // Trigger only if:
                        // - User didn’t scroll
                        // - Movement was minimal (a tap)
                        if !wasScrolled && totalDistance < 10 {
                            onCompletion()
                        }
                        
                        // Reset scroll tracking
                        wasScrolled = false
                    }
            )
    }
}

// MARK: - View Extension
extension View {
    /// Applies the `PressEffect` modifier to give a press-down
    /// animation effect and run code on tap completion.
    ///
    /// - Parameter onCompletion: Closure to run after a valid press.
    func pressEffect(onCompletion: @escaping () -> Void) -> some View {
        self.modifier(PressEffect(onCompletion: onCompletion))
    }
    
    /// Applies only the visual press effect without running any code.
    func pressEffect() -> some View {
        self.modifier(PressEffect(onCompletion: { }))
    }
}
