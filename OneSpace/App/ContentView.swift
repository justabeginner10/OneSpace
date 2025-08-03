//
//  ContentView.swift
//  OneSpace
//
//  Created by Aditya Raj on 03/08/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        VStack(spacing: 12) {
            Text("Hello Everyone")
                .font(.museoModernoBold(20))
            
            Text("Welcome")
                .font(.museoModerno(.regular, size: 16))
        }
    }
}

#Preview {
    ContentView()
}
