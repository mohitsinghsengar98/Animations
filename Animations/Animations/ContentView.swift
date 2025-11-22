//
//  ContentView.swift
//  Animations
//
//  Created by Mohit Sengar on 19/11/25.
//

/*
 
 Go back to the Guess the Flag project and add some animation:

- When you tap a flag, make it spin around 360 degrees on the Y axis.
- Make the other two buttons fade out to 25% opacity.
- Add a third effect of your choosing to the two flags the user didn’t choose – maybe make them scale down? Or flip in a different direction? Experiment!
 
 */
import SwiftUI

struct ContentView: View {
    @State private var countries = ["India","Russia","Isrel","China","Bhutan","Nepal","Afganistan","Pakistan","Australia","US","UK","Germany","Monaco","Spain","Italy","France","Poland","Nigeria","Bangladesh","Myanmar","Estonia","Ireland","Ukraine"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var isRotateEnabled = false
    @State private var selectedRow : Int? = nil
    
    var body: some View {
        ZStack{
//            LinearGradient(colors: [.blue,.black], startPoint: .top, endPoint: .bottom)
//                .ignoresSafeArea()
            RadialGradient(stops: [.init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                                   .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)],
                           center: .top, startRadius: 200, endRadius: 700).edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                Text("Guess the Flag").font(.largeTitle.bold())
                    .foregroundStyle(.white)
                VStack(spacing: 15){
                    VStack {
                        Text("Tap the flag of").font(.subheadline.weight(.heavy)).foregroundStyle(.secondary)
                        Text(countries[correctAnswer]).font(.largeTitle.weight(.semibold)).foregroundStyle(.black)
                    }
                    
                    // with scale down
                    ForEach(0..<3){ number in
                        Image(countries[number])
                                .resizable()
                                .frame(width: 200, height: 100)
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                                .rotation3DEffect(
                                    .degrees(isRotateEnabled && selectedRow == number ? 360 : 0),
                                    axis: (x: 0, y: 1, z: 0)
                                )
                                .opacity(isRotateEnabled && selectedRow != number ? 0.2 : 1.0)
                                .scaleEffect(isRotateEnabled && selectedRow != number ? 0.5 : 1.0)
                                .onTapGesture {
                                    withAnimation(.linear(duration: 1.0)) {
                                        selectedRow = number
                                        isRotateEnabled.toggle()
                                        flagTapped(number: number)
                                    }
                                }
                    }
                }.frame(maxWidth:.infinity)
                    .padding(.vertical,20)
                    .background(.regularMaterial)
                    .clipShape(.rect(cornerRadius: 20))
                Spacer()
                Spacer()
                Text("Score: \(score)")
                    .font(.title.bold())
                    .foregroundStyle(.white)
                Spacer()
            }.padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue",action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
    }
    
    func flagTapped(number:Int){
        if(number == correctAnswer){
            scoreTitle = "Correct"
            score += 10
        }else{
            scoreTitle = "Wrong"
        }
        
        showingScore = true
    }
    
    func askQuestion(){
        isRotateEnabled = false
        selectedRow = nil
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
