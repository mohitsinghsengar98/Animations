//
//  ContentView.swift
//  Animations
//
//  Created by Mohit Sengar on 19/11/25.
//

import SwiftUI

struct ContentView: View {
    @State private var dragAmount = CGSizeZero
    
    var body: some View {
        LinearGradient(colors: [ .yellow, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300,height: 200)
            .clipShape(.rect(cornerRadius: 10.0))
            .offset(dragAmount)
            .gesture(
                DragGesture()
                .onChanged{ dragAmount = $0.translation }
                    .onEnded{ _ in
                        withAnimation(.bouncy){ // explicitly to the end only
                            dragAmount = .zero
                        }
                    }
            )
//            .animation(.bouncy, value: dragAmount)// implicit animation approach for both onchange and onEnded
    }
}

#Preview {
    ContentView()
}
