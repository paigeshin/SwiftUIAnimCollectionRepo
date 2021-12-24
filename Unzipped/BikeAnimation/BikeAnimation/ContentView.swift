//
//  ContentView.swift
//  BikeAnimation
//
//  Created by Amos Gyamfi on 24.4.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var rotateRim = 0
    @State private var scaleUpDown = 0.95
    @State private var rotateCap = -15
    @State private var animateDashPhase = 0
    @State private var swingLwing = 0
    @State private var swingRwing = 0
    @State private var moveBird = -300
    
    var body: some View {
        ZStack {
            Image("bg") // Backgroung view
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Image("f_wheel") // Front wheel
                .offset(x: 53, y: 85)
            
            Image("f_rim") // Front rim
                .rotationEffect(.degrees(Double(rotateRim)))
                .offset(x: 53, y: 85)
                .animation(Animation.linear(duration: 10).repeatForever(autoreverses: false).speed(5))
               
            
            Image("b_wheel") // Rear wheel
                .offset(x: -103, y: 85)
            
            Image("b_rim") // Rear rim
                .rotationEffect(.degrees(Double(rotateRim)))
                .offset(x: -103, y: 85)
                .animation(Animation.linear(duration: 10).repeatForever(autoreverses: false).speed(5))
            
            ZStack {
                Image("biker") // Biker with bike frame
                    .resizable()
                    .aspectRatio(contentMode: .fit)
               
                Image("cap") // Biker's cap
                    .rotationEffect(.degrees(Double(rotateCap)))
                    .offset(x: -10, y: -116)
                    
            }
            .scaleEffect(CGFloat(scaleUpDown), anchor: .bottom)
            .animation(Animation.interpolatingSpring(stiffness: 170, damping: 5).repeatForever(autoreverses: false))
            
           Rectangle() // Bike lane
            .stroke(style: StrokeStyle(lineWidth: 2, dash: [7, 7], dashPhase: CGFloat(animateDashPhase)))
            .frame(width: UIScreen.main.bounds.width, height: 2)
            .foregroundColor(Color(#colorLiteral(red: 0.9423910975, green: 0.936123848, blue: 1, alpha: 1)))
            .offset(y: 144)
            .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false).speed(5))
            
            // Large bird
            ZStack {
                Image("l_wing") // Left wing
                    .rotationEffect(.degrees(Double(swingLwing)), anchor: .trailing)
                    .animation(Animation.easeInOut(duration: 0.25).repeatForever(autoreverses: true))
                
                Image("r_wing") // Right wing
                    .rotationEffect(.degrees(Double(swingRwing)), anchor: .leading)
                    .animation(Animation.easeInOut(duration: 0.25).repeatForever(autoreverses: true))
                    .offset(x: 9, y: 4)
            }
            .scaleEffect(1.5)
            .animation(Animation.easeInOut(duration: 0.25).repeatForever(autoreverses: true))
            .offset(y: CGFloat(moveBird))
            
            // Small bird
            ZStack {
                Image("l_wing")
                    .rotationEffect(.degrees(Double(swingLwing)), anchor: .trailing)
                    .animation(Animation.easeOut(duration: 0.25).repeatForever(autoreverses: true))
                
                Image("r_wing")
                    .rotationEffect(.degrees(Double(swingRwing)), anchor: .leading)
                    .animation(Animation.easeOut(duration: 0.25).repeatForever(autoreverses: true))
                    .offset(x: 9, y: 4)
            }
            .animation(Animation.easeInOut(duration: 0.25).repeatForever(autoreverses: true))
            .offset(x: 100, y: CGFloat(moveBird))
            
        }
        .onAppear() {
            rotateRim = 360
            scaleUpDown = 1
            rotateCap = 5
            animateDashPhase = 10
            swingLwing = 45
            swingRwing = -45
            moveBird = -305
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
