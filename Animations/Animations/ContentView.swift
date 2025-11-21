//
//  ContentView.swift
//  Animations
//
//  Created by Mohit Sengar on 19/11/25.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 0.0
    @State private var enable = false
    
    var body: some View {
            
        Spacer()
        Button("Tap Me"){
            withAnimation(.spring(duration: 1.0, bounce: 0.5)){
                animationAmount += 360
            }
        }.padding(50)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .shadow(radius: 20.0)
            .rotation3DEffect(.degrees(animationAmount),axis: (x: Double.random(in:0...360), y: Double.random(in:0...360), z: Double.random(in:0...360)))
        
        Spacer()
        Button("Tap Me"){
            enable.toggle()
            withAnimation(.spring(duration: 1.0, bounce: 0.5)){
                animationAmount += 360
            }
        }.padding(50)
            .background(enable ? .red : .blue)
            .foregroundStyle(.white)
            .clipShape(/*enable ? AnyShape(.circle) :*/ AnyShape(.rect(cornerRadius:enable ? 60.0 : 10.0)) )
            .shadow(radius: 20.0)
            .animation(.spring(duration: 1.0,bounce: 0.7), value:!enable)
            
//            .rotation3DEffect(.degrees(animationAmount),axis: (x: Double.random(in:0...360), y: Double.random(in:0...360), z: Double.random(in:0...360)))
        Spacer()
    }
}

#Preview {
    ContentView()
}
