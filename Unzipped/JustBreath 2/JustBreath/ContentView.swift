//
//  ContentView.swift
//  JustBreath
//
//  Created by Amos Gyamfi on 9.11.2020.
//

import SwiftUI

struct ContentView: View {
    
    @State private var grow = false // Scale the middle from 0.5 to 1
    @State private var rotateFarRight = false
    @State private var rotateFarLeft = false
    @State private var rotateMiddleLeft = false
    @State private var rotateMiddleRight = false
    @State private var showShadow = false
    @State private var showRightStroke = false
    @State private var showLeftStroke = false
    @State private var changeColor = false
    
    var body: some View {
        VStack {
            Spacer()
            
            // Pull content from DetailsViwl.swift
            DetailsView()
            
            Spacer()
            
            ZStack {
                
                Image("flower") // Middle
                    .scaleEffect(grow ? 1 : 0.5, anchor: .bottom)
                    .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                    .onAppear {
                        grow.toggle()
                    }
                
                
                Image("flower")  // Middle left
                    .rotationEffect(.degrees( rotateMiddleLeft ? -25 : -5), anchor: .bottom)
                    .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                    .onAppear {
                        rotateMiddleLeft.toggle()
                        }
                
                Image("flower")  // Middle right
                    .rotationEffect(.degrees( rotateMiddleRight ? 25 : 5), anchor: .bottom)
                    .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                    .onAppear {
                        rotateMiddleRight.toggle()
                    }
                
                Image("flower")  // Left
                    .rotationEffect(.degrees( rotateFarLeft ? -50 : -10), anchor: .bottom)
                    .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                    .onAppear {
                        rotateFarLeft.toggle()
                    }
                
                Image("flower")  // Right
                    .rotationEffect(.degrees( rotateFarRight ? 50 : 10), anchor: .bottom)
                    .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                    .onAppear {
                        rotateFarRight.toggle()
                    }
                
                Circle()  // Quarter dotted circle left
                    .trim(from: showLeftStroke ? 0 : 1/4, to: 1/4)
                    .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round, dash: [1, 14]))
                    .frame(width: 215, height: 215, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    .rotationEffect(.degrees(-180), anchor: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .offset(x: 0, y: -25)
                    .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                    .onAppear {
                        showLeftStroke.toggle()
                        }
                            
                Circle()  // Quarter dotted circle right
                    .trim(from: 0, to: showRightStroke ? 1/4 : 0)
                    .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round, dash: [1, 14]))
                    .frame(width: 215, height: 215, alignment: .center)
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    .rotationEffect(.degrees(-90), anchor: .center)
                    .offset(x: 0, y: -25)
                    .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                    .onAppear {
                        showRightStroke.toggle()
                    }
                
            } // Container for flower
            .shadow(radius: showShadow ? 20 : 0) // Switching from flat to elevation
            .hueRotation(Angle(degrees: changeColor ? -45 : 45)) // Animating Chroma
            .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
            .onAppear {
                changeColor.toggle()
                showShadow.toggle()
                }
            
            Spacer()
            
            Color(#colorLiteral(red: 0.4666666667, green: 0.4666666667, blue: 0.4666666667, alpha: 1))
                .frame(width: 92, height: 46, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .cornerRadius(23)
                .opacity(0.5)
                .overlay(Text("End"))
            
            Spacer()
            
        } // Container for all views
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
