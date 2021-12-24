//
//  ContentView.swift
//  MS_TeamsStyleCallingAnimation
//
//  Created by Amos Gyamfi on 20.5.2021.
//

import SwiftUI

struct ContentView: View {
    
    // Initial scale transforms
    @State private var animateLogo = 0.35
    @State private var animateLarger = 0.5
    @State private var animateMedium = 0.5
    @State private var animateSmaller = 0.7
    
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
                Circle()
                    .stroke(lineWidth: 20)
                    .frame(width: 202, height: 202)
                    .foregroundColor(Color(#colorLiteral(red: 0.5818830132, green: 0.2156915367, blue: 1, alpha: 1)))
                    .opacity(0.5)
                    .scaleEffect(CGFloat(animateLarger))
                    .animation(Animation.easeOut(duration: 1).repeatForever(autoreverses: true).delay(0.6))
                
                // Heart icon: Medium
                Circle()
                    .stroke(lineWidth: 20)
                    .frame(width: 172, height: 172)
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 0.2527923882, blue: 1, alpha: 1)))
                    .opacity(0.5)
                    .scaleEffect(CGFloat(animateMedium))
                    .animation(Animation.easeOut(duration: 1).repeatForever(autoreverses: true).delay(0.4))
                    
                // Heart icon: Smaller
                Circle()
                    .stroke(lineWidth: 20)
                    .frame(width: 122, height: 122)
                    .foregroundColor(Color(#colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)))
                    .opacity(0.5)
                    .scaleEffect(CGFloat(animateSmaller))
                    .animation(Animation.easeOut(duration: 1).repeatForever(autoreverses: true).delay(0.2))
                
                Image("amos") // Heart-shape img
                    .clipShape(Circle())
                    .scaleEffect(CGFloat(animateLogo))
                    .blendMode(.hardLight)
                    .animation(Animation.easeOut(duration: 1).repeatForever(autoreverses: true))
            
            } // Animated views
            .onAppear() { // Final scale transforms
                animateLarger = 1.2
                animateMedium = 1.2
                animateSmaller = 1.5
                animateLogo = 0.25
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
            .preferredColorScheme(.dark)
    }
}
