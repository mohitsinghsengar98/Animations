//
//  ContentView.swift
//  Animations
//
//  Created by Mohit Sengar on 19/11/25.
//

import SwiftUI

struct ContentView: View {
    @State private var enable = false
    @State private var dragAmount = CGSizeZero
    let letters = Array("Hello SwiftUI")
    
    var body: some View {
        HStack(spacing:0){
            ForEach(0..<letters.count, id:\.self){num in
                Text(String(letters[num]))
                    .padding(5)
                    .font(.title2)
                    .background(enable ? .red : .blue)
                    .foregroundStyle(.white)
                    .offset(dragAmount)
                    .animation(.linear.delay(Double(num)/20),value: dragAmount)
                    .gesture(DragGesture()
                        .onChanged{ dragAmount = $0.translation}
                        .onEnded{_ in
                            dragAmount = .zero
                            enable.toggle()
                        })
            }
        }
    }
}

#Preview {
    ContentView()
}
