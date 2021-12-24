//
//  Bubbles.swift
//  Kayak
//
//  Created by Amos Gyamfi on 23.8.2020.
//

import Foundation
import SwiftUI

struct Bubbles: View {
    
    @State private var showRightBubbles = false
    @State private var showLeftBubbles = false
    
    var body: some View {
        ZStack {  // Container: Both bubbles
            ZStack {  // Bubble container right
                Circle()
                    .trim(from: 1/4, to: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                    .stroke(lineWidth: 2)
                    .frame(width: 50, height: 50)
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                
                Circle()
                    .stroke(lineWidth: 1)
                    .frame(width: 15, height: 15)
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                
                Circle()
                    .trim(from: 0, to: 1/2)
                    .stroke(lineWidth: 2)
                    .frame(width: 25, height: 25)
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                
                Circle()
                    .stroke(lineWidth: 1)
                    .frame(width: 35, height: 35)
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    
            }  // Bubble container right ends
            .opacity(showRightBubbles ? 0.25 : 0)
            .scaleEffect(showRightBubbles ? 2 : 0)
            .rotationEffect(.degrees(90))
            .offset(x: 150, y: showRightBubbles ? 120 : -70)
            .blendMode(.screen)
            .animation(Animation.easeOut(duration: 1).delay(1).speed(1).repeatForever(autoreverses: false))
            .onAppear(){
                showRightBubbles.toggle()
        }
            
            ZStack {  // Bubble container left
                Circle()
                    .trim(from: 1/4, to: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                    .stroke(lineWidth: 2)
                    .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                
                Circle()
                    .stroke(lineWidth: 1)
                    .frame(width: 15, height: 15, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                
                Circle()
                    .trim(from: 0, to: 1/2)
                    .stroke(lineWidth: 2)
                    .frame(width: 25, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                
                Circle()
                    .stroke(lineWidth: 1)
                    .frame(width: 35, height: 35, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    
            }  // Bubble container left ends
            .opacity(showLeftBubbles ? 0.25 : 0)
            .scaleEffect(showLeftBubbles ? 2 : 0)
            .rotationEffect(.degrees(-45))
            .offset(x: -170, y: showLeftBubbles ? 100 : -70)
            .blendMode(.lighten)
            .animation(Animation.easeInOut(duration: 1).delay(1).speed(1).repeatForever(autoreverses: false))
            .onAppear(){
                showLeftBubbles.toggle()
        }
            
        } // Container: Both bubbles
    }
}

struct Bubbles_Previews: PreviewProvider {
    @State private var showRightBubbles = false
    static var previews: some View {
        Bubbles()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}



