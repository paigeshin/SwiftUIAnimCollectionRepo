//
//  ContentView.swift
//  Coffee_Making_Animation
//
//  Created by Amos Gyamfi on 20.4.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var moveRight = 360
    @State private var moveLeft = -345
    @State private var dropping = 0
    @State private var vaporize = 80
    
    var body: some View {
        VStack {
            
            Text("SwiftUI Coffee")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
            Text("Make your own coffee")
                .font(.subheadline)
            
            ZStack {
                
                Image("coffee_drop")
                    .offset(x: -10, y: CGFloat(dropping))
                    .animation(Animation.easeIn(duration: 1).repeatForever(autoreverses: false))
                    .onAppear() {
                        dropping = 95
                    }
                
                
                Image("coffee_drop")
                    .offset(y: CGFloat(dropping))
                    .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: false))
                    .onAppear() {
                        dropping = 95
                    }
                
                Image("coffee_drop")
                    .offset(x: 20, y: CGFloat(dropping))
                    .animation(Animation.easeOut(duration: 1).repeatForever(autoreverses: false))
                    .onAppear() {
                        dropping = 95
                    }
                
                
                VStack(spacing: -62) {
                    
                    Image("mocha")
                    
                    Image("coffe_machine")
                        
                }
              
                ZStack {
                    Image("coffee_left")
                        .offset(x: CGFloat(moveLeft), y: 100)
                        .animation(Animation.linear(duration: 10).repeatForever(autoreverses: false))
                        .onAppear() {
                            moveLeft = 345
                        }
                    
                    Image("coffee_right")
                        .offset(x: CGFloat(moveRight), y: 100)
                        .animation(Animation.linear(duration: 10).repeatForever(autoreverses: false))
                        .onAppear() {
                            moveRight = -360
                        }
                }
                .frame(width: 215, height: 400)
                .clipShape(Circle())
                
                Image("vapor")
                    .clipShape(Rectangle().offset(y: CGFloat(vaporize)))
                    .blur(radius: 20)
                    .offset(x: -90, y: -200)
                    .animation(Animation.timingCurve(0.68, -0.6, 0.32, 1.6).delay(0.2).speed(0.9).repeatForever(autoreverses: false))
                    .onAppear {
                        vaporize = 0
                    }
                
                Image("vapor")
                    .clipShape(Rectangle().offset(y: CGFloat(vaporize)))
                    .blur(radius: 20)
                    .offset(x: -90, y: -200)
                    .animation(Animation.timingCurve(0.68, -0.6, 0.32, 1.6).delay(0.2).speed(0.9).repeatForever(autoreverses: true))
                    .onAppear {
                        vaporize = 0
                    }
                
                Image("vapor")
                    .clipShape(Rectangle().offset(y: CGFloat(vaporize)))
                    .blur(radius: 20)
                    .offset(x: -90, y: -200)
                    .animation(Animation.timingCurve(0.68, -0.6, 0.32, 1.6).delay(0.4).speed(0.9).repeatForever(autoreverses: true))
                    .onAppear {
                        vaporize = 0
                    }
                    
            }
            
            RoundedRectangle(cornerRadius: 23)
                .frame(width: 200, height: 46)
                .foregroundColor(Color(#colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1)))
                .overlay(Label("Sign in with Apple", systemImage: "applelogo"))
            
            RoundedRectangle(cornerRadius: 23)
                .frame(width: 200, height: 46)
                .overlay(Text("Maybe later").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/))
            
        } // All views
        
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
