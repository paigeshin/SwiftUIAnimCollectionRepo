//
//  ContentView.swift
//  CallingAnimation
//
//  Created by Amos Gyamfi on 20.05.2021.
//

import SwiftUI

struct ContentView: View {
    
    // Initial scale transforms
    @State private var animateLogo = 0.7
    @State private var animateLarger = 0.5
    @State private var animateMedium = 0.5
    @State private var animateSmaller = 0.5
    
    var body: some View {
        VStack {
            
            VStack {
                Text("Amos Gyamfi")
                    .font(.title)
                
                Text("+35855901852")
                
                Text("Calling...")
                    .foregroundColor(Color(.systemTeal))
            }
            
            Spacer()
            
            ZStack {  // Animated views
                
                
                // Heart icon: Larger
                Image(systemName: "heart")
                    .font(.system(size: 212 + 80))
                    .foregroundColor(Color(#colorLiteral(red: 0.5818830132, green: 0.2156915367, blue: 1, alpha: 1)))
                    .opacity(0.5)
                    .scaleEffect(CGFloat(animateLarger))
                    .animation(Animation.easeOut(duration: 1).repeatForever(autoreverses: true).delay(0.6))
                
                // Heart icon: Medium
                Image(systemName: "heart")
                    .font(.system(size: 212 + 40))
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 0.2527923882, blue: 1, alpha: 1)))
                    .opacity(0.5)
                    .scaleEffect(CGFloat(animateMedium))
                    .animation(Animation.easeOut(duration: 1).repeatForever(autoreverses: true).delay(0.4))
                    
                // Heart icon: Smaller
                Image(systemName: "heart")
                    .font(.system(size: 212))
                    .foregroundColor(Color(#colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)))
                    .opacity(0.5)
                    .scaleEffect(CGFloat(animateSmaller))
                    .animation(Animation.easeOut(duration: 1).repeatForever(autoreverses: true).delay(0.2))
                
                Image("amos") // Heart-shape img
                    .scaleEffect(CGFloat(animateLogo))
                    .blendMode(.hardLight)
                    .animation(Animation.easeOut(duration: 1).repeatForever(autoreverses: true))
            
            } // Animated views
            .onAppear() { // Final scale transforms
                animateLarger = 1.2
                animateMedium = 1.2
                animateSmaller = 1.25
                animateLogo = 0.5
        }
            
            Spacer()
            
            HStack(spacing: 30) {
                
                Image(systemName: "mic.circle").font(.system(size: 48))
                
                Image(systemName: "phone.circle.fill").font(.system(size: 48)).foregroundColor(Color(.systemRed))
                
                Image(systemName: "phone.circle.fill").font(.system(size: 48)).foregroundColor(Color(.systemGreen))
                
                Image(systemName: "speaker.wave.2.circle").font(.system(size: 48))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
