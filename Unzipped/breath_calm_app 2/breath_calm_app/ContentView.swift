//
//  ContentView.swift
//  breath_calm_app
//
//  Created by Amos Gyamfi on 20.07.2021.
//  Copyright © 2021 Amos Gyamfi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var rotateOnCircle = 0 // 1. Rotate on circle
    @State private var breathIn = false // 2. Scale from 0.8 to 1
    @State private var hold = true // 3. Keep the size constant
    @State private var breathOut = false //4. Scale from 1 to 0.8
    
    // 5. Show and hide the text (breathin, hold, breathout)
    @State private var show = 0
    @State private var hide = 1
    
    
    let grape = Color(#colorLiteral(red: 0.5818830132, green: 0.2156915367, blue: 1, alpha: 1))
    let aqua = Color(#colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1))
    let iron = Color(#colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 1))
    let snow = Color(#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))
    
    let fillGradient = LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .bottomLeading, endPoint: .topTrailing)
    
    var body: some View {
        
            ZStack {
                ZStack {  // Graphical elements container
                    
                    fillGradient  // Central circle
                        .clipShape(
                            Circle())
                        .frame(width: 340, height: 340)
                    
                    Circle() // Region for hold
                        .stroke(lineWidth: 5)
                        .frame(width: 370, height: 370)
                        .foregroundColor(iron)
                    
                    Circle()  // Region for exhale
                        .trim(from: 0, to: 1/4)
                        .stroke(lineWidth: 5)
                        .frame(width: 370, height: 370)
                        .foregroundColor(aqua)
                        .rotationEffect(.degrees(-90))
                    
                    Circle()  // Region for inhale
                        .trim(from: 0, to: 1/4)
                        .stroke(lineWidth: 5)
                        .frame(width: 370, height: 370)
                        .foregroundColor(grape)
                        .rotationEffect(.degrees(90))
                    
                    Capsule() // Bottom
                        .trim(from: 1/2, to: 1)
                        .frame(width: 20, height: 25)
                        .foregroundColor(snow)
                        .offset(y: 187)
                    
                    Capsule()  // Top
                        .trim(from: 1/2, to: 1)
                        .frame(width: 20, height: 25)
                        .foregroundColor(snow)
                        .rotationEffect(.degrees(180))
                        .offset(y: -187)
                        
                    Capsule()  // Right
                        .trim(from: 1/2, to: 1)
                        .frame(width: 20, height: 25)
                        .foregroundColor(snow)
                        .rotationEffect(.degrees(-90))
                        .offset(x: 187)
                    
                    Capsule()  // Left
                        .trim(from: 1/2, to: 1)
                        .frame(width: 20, height: 25)
                        .foregroundColor(snow)
                        .rotationEffect(.degrees(90))
                        .offset(x: -187)
                    
                    ZStack {
                        Circle()  // Path along which the blue capsule moves
                            .stroke()
                            .frame(width: 360, height: 360)
                            .opacity(0)
                    
                        Capsule()  // 1. Rotating capsule
                            .trim(from: 1/2, to: 1)
                            .frame(width: 25, height: 25)
                            .foregroundColor(aqua)
                            .offset(y: 187)  // Must be above rotation effect
                            .rotationEffect(.degrees(Double(rotateOnCircle)))
                            .onAppear() {
                                withAnimation(Animation.linear(duration: 16)) {
                                rotateOnCircle = 360
                                }
                        }
                    }
                    
                }.frame(width: 360, height: 360)
                    .scaleEffect(breathIn ? 1 : 0.8) // 2. Scale from 0.8 to 1
                    .scaleEffect(hold ? 1 : 1) // 3. Keep the size constant
                    .scaleEffect(breathOut ? 0.8 : 1) //4. Scale from 1 to 0.8
                    
                    .onAppear() {
                        withAnimation(Animation.linear(duration: 4)){
                        breathIn.toggle()
                        
                            
                        }
                        
                        withAnimation(Animation.linear(duration: 4).delay(4)){
                        hold.toggle()
                        }
                        
                        withAnimation(Animation.linear(duration: 4).delay(8)){
                        breathOut.toggle()
                        
                        }
                        
                        withAnimation(Animation.linear(duration: 4).delay(12)){
                        hold.toggle()
                       
                        }
                        
                }
                ZStack {  // 5
                    Text("Breathe Out")
                        .foregroundColor(snow)
                        .scaleEffect(1)
                        .opacity(Double(hide))
                        .animation(Animation.easeOut.delay(12))
                        .opacity(Double(show))
                        .animation(Animation.easeOut.delay(8))
                        .onAppear(){
                           hide = 0
                    }
                    
                    Text("Hold") // Second hold
                        .foregroundColor(snow)
                        .scaleEffect(1)
                        .opacity(Double(show))
                        .animation(Animation.easeOut.delay(4))
                        .opacity(Double(hide))
                        .animation(Animation.easeOut.delay(8))
                        .onAppear(){
                           hide = 1
                            show = 1
                    }
                    
                    Text("Hold")  // Fierst hold
                        .foregroundColor(snow)
                        .scaleEffect(1)
                        .opacity(Double(show))
                        .animation(Animation.easeOut.delay(12))
                        .opacity(Double(hide))
                        .animation(Animation.easeOut.delay(16))
                        .onAppear(){
                           hide = 0
                    }
                    
                    Text("Breathe In")
                        .foregroundColor(snow)
                        .opacity(Double(hide))
                        .animation(Animation.easeInOut(duration: 0.4).delay(4))
                        .onAppear(){
                            hide = 0
                    }
                }
                    
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
