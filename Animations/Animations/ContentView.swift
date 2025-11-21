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
            Stepper("Scale up the button below", value: $animationAmount.animation(), in: 0...5)
            
            Spacer()
            
            Button("Tap Me"){
                animationAmount += 1
            }.padding(50)
                .background(.red)
                .foregroundStyle(.white)
                .clipShape(.circle)
                .overlay{
                    Circle().stroke(.red)
                        .scaleEffect(animationAmount)
                        .opacity(2 - animationAmount)
                        .animation(.easeOut(duration: 1).repeatForever(autoreverses: false), value: animationAmount)
                }.onAppear{ animationAmount = 2 }
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}
