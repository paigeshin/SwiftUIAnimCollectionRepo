//
//  ContentView.swift
//  Spring_Animation_in_Depth
//
//  Created by Amos Gyamfi on 30.1.2021.
//

import SwiftUI

/// An interpolating spring animation that uses a damped spring
/// model to produce values in the range [0, 1] that are then used
/// to interpolate within the [from, to] range of the animated
/// property. Preserves velocity across overlapping animations by
/// adding the effects of each animation.
///
/// - Parameters:
///   - mass: The mass of the object attached to the spring.
///   - stiffness: The stiffness of the spring.
///   - damping: The spring damping value.
///   - initialVelocity: the initial velocity of the spring, as
///     a value in the range [0, 1] representing the magnitude of
///     the value being animated.
/// - Returns: a spring animation.

struct ContentView: View {
    
    @State private var moveBall = false
    
    var body: some View {
        VStack {
            
            Text("Uenderstanding Spring Animation Parameters")
                .font(.largeTitle)
            
           Spacer()
            
            ZStack {
            
                Image("down")
                
                Image("ball")
                    .offset(y: moveBall ? 10 : -30)
                    .animation(Animation.spring(response:  0.55, dampingFraction: 0.825, blendDuration: 0).repeatForever(autoreverses: false))
                    .onAppear(){
                        moveBall.toggle()
                    }
                
                Image("top")
                    .offset(x: 3)
            }
            .scaleEffect(2)
            
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
