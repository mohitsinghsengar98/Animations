//
//  ContentView.swift
//  Animations
//
//  Created by Mohit Sengar on 19/11/25.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0
    var body: some View {
        VStack {
            Button("Tap Me"){
                animationAmount += 1
            }.padding(50)
                .background(.red)
                .foregroundStyle(.white)
                .clipShape(.circle)
                .scaleEffect(animationAmount)
                .blur(radius: (animationAmount - 1) * 3)
                .animation(.easeInOut(duration: 1).repeatCount(3, autoreverses: true), value: animationAmount)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
