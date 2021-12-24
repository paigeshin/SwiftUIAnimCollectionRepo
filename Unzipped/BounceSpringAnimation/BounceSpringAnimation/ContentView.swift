//
//  ContentView.swift
//  BounceSpringAnimation
//
//  Created by Amos Gyamfi on 4.2.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var bounce = false
    
    var body: some View {
        VStack {
            
            Spacer()
            
            HStack {
                Image("calling")
                
                Image("garageband")
                    .offset(y: bounce ? 0 : -120)
                    .animation(Animation.interpolatingSpring(stiffness: 700, damping: 15, initialVelocity: 0).delay(0.5).repeatForever(autoreverses: false))
                    .onAppear() {
                        bounce.toggle()
                    }
                
                Image("icloud")
                
                Image("notes")
            }
            
        }
        .frame(width: 480, height: 240, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
