//
//  ContentView.swift
//  Calming Breathe Animation
//
//  Created by Amos Gyamfi on 9.11.2020.
//

import SwiftUI

struct ContentView: View {
    @State private var rBreath = false
    @State private var lBreath = false
    @State private var mrBreath = false
    @State private var mlBreath = false
    @State private var showShadow = false
    @State private var showRightStroke = false
    @State private var showLeftStroke = false
    @State private var showInhale = true
    @State private var showExhale = false
    
    var body: some View {
            
        VStack {
            
            Text("Amos")
            ZStack {
                    
                    ZStack {
                        Image("flower")  // Middle back
                            .rotationEffect(.degrees(0), anchor: .bottom)
                       
                        Image("flower")  // Immediate left
                            .rotationEffect(.degrees( mlBreath ? -25 : -5), anchor: .center)
                            .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                            .onAppear {
                                mlBreath.toggle()
                            }
                        
                        Image("flower")  // Immediate right
                            .rotationEffect(.degrees( mrBreath ? 25 : 5), anchor: .center)
                            .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                            .onAppear {
                                mrBreath.toggle()
                            }
                        
                        Image("flower")  // Far left
                            .rotationEffect(.degrees( lBreath ? -50 : -10), anchor: .center)
                            .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                            .onAppear {
                                lBreath.toggle()
                            }
                        
                        Image("flower")  // Far right
                            .rotationEffect(.degrees( rBreath ? 50 : 10), anchor: .center)
                            .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                            .onAppear {
                                rBreath.toggle()
                            }
                     // Darken edges: Apply shadow when the flower is opened
                    }.shadow(radius: showShadow ? 20 : 0)
                    .hueRotation(Angle(degrees: showShadow ? 0 : 180))
                     .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                     .onAppear {
                        showShadow.toggle()
                    }
                    
                    Circle()  // Left Stroke
                        .trim(from: showLeftStroke ? 0 : 1/4, to: 1/4)
                        .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round, dash: [7, 14]))
                        .frame(width: 215, height: 2215, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        .rotationEffect(.degrees(-180), anchor: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .offset(x: 0, y: -25)
                        .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                        .onAppear {
                            showLeftStroke.toggle()
                       }
                    
                    Circle()  // Right stroke
                        .trim(from: 0, to: showRightStroke ? 1/4 : 0)
                        .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round, dash: [7, 14]))
                        .frame(width: 215, height: 2215, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        .rotationEffect(.degrees(-90), anchor: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .offset(x: 0, y: -25)
                        .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                        .onAppear {
                            showRightStroke.toggle()
                       }
            }
        } //Flower container
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
