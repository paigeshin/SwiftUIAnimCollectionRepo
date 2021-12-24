//
//  ContentView.swift
//  MatchingAntsEffect
//
//  Created by Amos Gyamfi on 3.5.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var moveDashes = 100
    @State private var moveRight = false
    
    let chainGradient = LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
    
    var body: some View {
        VStack {
            
            Text("How to Animate Alignment and Dash Phase in SwiftUI")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            VStack(alignment: moveRight ? .trailing : .leading) {
                
                    Image(systemName: "gift.fill")
                        .font(.largeTitle)
                        .animation(Animation.easeIn(duration: 8).delay(-0.5).repeatForever(autoreverses: false))
                        
                
                ZStack {
                    HStack {
                        
                        Circle()
                            .frame(width: 20, height: 20)
                        
                        Spacer()
                        
                        Circle()
                            .frame(width: 20, height: 20)
                    }.padding(.horizontal, 60)
                    
                    chainGradient
                        .frame(width: 340, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .mask(RoundedRectangle(cornerRadius: 40)
                                .stroke(style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round, dash: [8, 14], dashPhase: CGFloat(moveDashes)))
                                .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false).speed(0.5)))
                }
            } // All views
            .padding()
            .onAppear() {
                moveRight.toggle()
                moveDashes = -100
        }
            
            Spacer()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
