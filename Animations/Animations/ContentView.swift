//
//  ContentView.swift
//  Animations
//
//  Created by Mohit Sengar on 19/11/25.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier{
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount),anchor: anchor)
            .clipped()
    }
}

extension AnyTransition{
    static var pivotLeft: AnyTransition{
        .modifier(active: CornerRotateModifier(amount: -90, anchor: .topLeading),
                  identity: CornerRotateModifier(amount: 0, anchor: .topLeading))
    }
    
    static var pivotRight: AnyTransition{
        .modifier(active: CornerRotateModifier(amount: 90, anchor: .topTrailing),
                  identity: CornerRotateModifier(amount: 0, anchor: .topTrailing))
    }
}

struct ContentView: View {
    @State private var isShowingRed = false
    
    var body: some View {
        ZStack{
            
            if(!isShowingRed){
                Rectangle()
                    .fill(.blue)
                    .frame(width: 200,height: 200)
                    .transition(.pivotRight)
                
            }
            if(isShowingRed){
                Rectangle()
                    .fill(.red)
                    .frame(width: 200,height:200)
                    .transition(.pivotLeft)
            }
        }.onTapGesture {
            withAnimation{
                isShowingRed.toggle()
            }
        }
    }
}

#Preview {
    ContentView()
}
