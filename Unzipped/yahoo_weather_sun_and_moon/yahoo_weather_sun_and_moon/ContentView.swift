//
//  ContentView.swift
//  yahoo_weather_sun_and_moon
//
//  Created by Amos Gyamfi on 14.05.2021.
//  Copyright © 2020 Amos Gyamfi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var moveAlongPath = 20
    @State private var scaleX = 0.0
    
    let blackPhoneScreen =  Color(#colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1))

    var body: some View {
       
        ZStack {
            blackPhoneScreen // Phone screen
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 400) {
               
                Text("Sun & Moon") // Label
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                HStack {
                    Text("5:44 AM")  // Label
                        .font(.caption)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Text("20:01 PM")  // Label
                        .font(.caption)
                        .foregroundColor(.white)
                }
                
                Spacer()
                
            }.padding()
               
            ZStack {
                
                Circle()  // Circular path: Dotted semicircle
                    .trim(from: 1/2, to: 1)
                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [7, 7]))
                    .frame(width:   300, height: 300)
                    .foregroundColor(.yellow)
                
                Image(systemName: "sun.max")  // Sun symbol
                    .font(.title)
                    .foregroundColor(.yellow)
                    .offset(x: -150)
                    .rotationEffect(.degrees(Double(moveAlongPath)))
                 // Above rotation Effect makes the sun moves along the path
                    .animation(Animation.easeInOut(duration: 5).delay(2).repeatForever(autoreverses: false))
                    .onAppear() {
                        moveAlongPath = 145
                    }
                    
                ZStack {  // Parent view
                    Rectangle() // Masked rectangle
                      .frame(width:   400, height: 150)
                      .foregroundColor(.yellow)
                      .opacity(0.1)
                        .scaleEffect(x: CGFloat(scaleX), anchor: .leading)
                      .offset(y: -75)
                        .animation(Animation.easeInOut(duration: 5).delay(2).repeatForever(autoreverses: false))
                        .onAppear() {
                            scaleX = 0.8
                        }
                      
                }
                .frame(width: 300, height: 300)
                .clipShape(Circle())
                    
                Rectangle()  // X-axis
                    .frame(width: 400, height: 1)
                    .foregroundColor(.white)
                    .opacity(0.5)
                
                Circle() // Point Left
                    .frame(width: 10, height: 10)
                    .foregroundColor(.yellow)
                    .offset(x: -150)
                
                Circle() // Point Right
                    .frame(width: 10, height: 10)
                    .foregroundColor(.yellow)
                    .offset(x: 150)
            }// Inner container
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
