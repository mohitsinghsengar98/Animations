//
//  ContentView.swift
//  Animations
//
//  Created by Mohit Sengar on 19/11/25.
//

import SwiftUI

struct ContentView: View {
    @State private var enable = false
    
    var body: some View {
        VStack{
            Button("Tap Me"){
                withAnimation{
                    enable.toggle()
                }
            }
            
            if(enable){
                Rectangle()
                    .fill(.red)
                    .frame(width: 200,height: 200)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
    }
}

#Preview {
    ContentView()
}
