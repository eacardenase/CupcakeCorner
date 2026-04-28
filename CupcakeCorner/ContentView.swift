//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Edwin Cardenas on 4/27/26.
//

import SwiftUI

struct ContentView: View {
    @State private var counter = 0

    var body: some View {
        Button("Tap Count: \(counter)") {
            counter += 1
        }
        .sensoryFeedback(.increase, trigger: counter)
        // .sensoryFeedback(.impact(flexibility: .soft, intensity: 0.5), trigger: counter)
        // .sensoryFeedback(.impact(flexibility: .rigid, intensity: 1), trigger: counter)
        // .sensoryFeedback(.impact(weight: .heavy, intensity: 1), trigger: counter)
    }
}

#Preview {
    ContentView()
}
