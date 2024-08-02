//
//  ContentView.swift
//  WidgetIntentTest
//
//  Created by Przemyslaw Bobak on 17/07/2024.
//

import SwiftUI

struct ContentView: View {

    var favouriteEmoji: String?

    var body: some View {
        VStack {
            if let value = favouriteEmoji {
                Text("It worked! Favourite emoji: \(value)")
            } else {
                Text("No favourite emoji. Tap on the home screen widget to trigger the app intent.")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
