//
//  ContentView.swift
//  looping
//
//  Created by Amos Gyamfi on 27.04.2021
//

import SwiftUI

struct ContentView: View {
    
    //Set initial states of animation
    @State var move = -600 // Initial horrizontal position
    @State var rotate = -10 // Initial rotation
    @State var jump = 0 // Initial vertical position
    
    var body: some View {
        ZStack {
            
            Image("wave")
                .offset(x: CGFloat(move))
                .animation(Animation.linear(duration: 4).repeatForever(autoreverses: false))
                
            
            Image("duck")
                .scaleEffect(0.5, anchor: .center)
                .rotationEffect(.degrees(Double(rotate)))
                .offset(y: CGFloat(jump))
                .animation(Animation.easeInOut(duration: 0.3).repeatForever(autoreverses: true))
                
        }
        .onAppear() {
            move = 600 // Final horrizontal position
            rotate = 15 // Final rotation
            jump = -20 // Final vertical position
    }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
#endif
