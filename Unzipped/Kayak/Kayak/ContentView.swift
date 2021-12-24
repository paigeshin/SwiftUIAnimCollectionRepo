//
//  ContentView.swift
//  Kayak
//
//  Created by Amos Gyamfi on 02.5.2021.
//

import SwiftUI

struct ContentView: View {
    
    // Starting rotation values
    @State private var moveLeftHand = -12.5
    @State private var moveRightHand = 12.5
    @State private var moveRightPaddle = 12.5
    @State private var moveLeftPaddle = -12.5
    
    // Starting offset value
    @State private var moveHead = 12.5
    @State private var move = -2.5
    
    // Initial settings for background image
    @State private var zoomBackground = 3.0
    
    
    var body: some View {
        ZStack {  // Background view
            Image("oleta-fl")
                .scaleEffect(CGFloat(zoomBackground))
                .offset(y: -250)
                .animation(Animation.easeInOut(duration: 30).repeatForever(autoreverses: false))
                
            Birds()
            
            // Bubbles
            Bubbles()
             
            ZStack {  // Kayak
                Image("bow")
                    .offset(y: CGFloat(move))
                    .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
                
                Image("paddleLeft")
                    .offset(x: -36, y: 12)
                    .rotationEffect(.degrees(moveLeftPaddle), anchor: .bottomTrailing)
                    .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
                
                Image("paddleRight")
                    .offset(x: 36, y: 12)
                    .rotationEffect(.degrees(moveRightPaddle), anchor: .bottomLeading)
                    .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
                
                Image("handLeft")
                    .offset(x: -12.5)
                    .rotationEffect(.degrees(moveLeftHand), anchor: .bottomTrailing)
                    .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
                
                Image("handRight")
                    .offset(x: 12.5)
                    .rotationEffect(.degrees(moveRightHand), anchor: .bottomLeading)
                    .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
                
                Image("head")
                    .offset(y: CGFloat(Double(moveHead)))
                    .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
                    
                
             
            }.scaleEffect(3)
            
            
        } // Kayak
        .onAppear(){
            move = 5
            moveLeftPaddle = 12.5
            moveRightPaddle = -12.5
            moveLeftHand = 12.5
            moveRightHand = -12.5
            moveHead = 6.5
            zoomBackground = 0.4
           
        }
            
        }
    }



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
