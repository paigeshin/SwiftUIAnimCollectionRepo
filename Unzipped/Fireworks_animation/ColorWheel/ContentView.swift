//
//  ContentView.swift
//  ColorWheel
//
//  Created by Amos Gyamfi on 22.6.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var acceleration = 5
    
    var body: some View {
        ZStack {
            Text("Feeling Fireworks")
                .font(.title)
            ForEach(0 ..< 12) { item in
                if #available(iOS 15.0, *) {
                    VStack(spacing: 100) {
                        Capsule()
                            .frame(width: 3, height: 6)
                            .foregroundColor(.teal)
                            .hueRotation(.degrees(Double(item) *  30))
                            .blendMode(.exclusion)
                            .offset(y: CGFloat(acceleration))
                            .rotationEffect(.degrees(Double(item) * 30), anchor: .bottom)
                            .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: false))
                            .task {
                                acceleration = 300
                        }
                        
                        Capsule()
                            .frame(width: 3, height: 6)
                            .foregroundColor(.orange)
                            .hueRotation(.degrees(Double(item) *  30))
                            .blendMode(.exclusion)
                            .offset(y: CGFloat(acceleration))
                            .rotationEffect(.degrees(Double(item) * 30), anchor: .bottom)
                            .animation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false))
                            .task {
                                acceleration = 300
                        }
                        
                        Capsule()
                            .frame(width: 3, height: 6)
                            .foregroundColor(.cyan)
                            .hueRotation(.degrees(Double(item) *  CGFloat.pi * 2.0))
                            .blendMode(.exclusion)
                            .offset(y: CGFloat(acceleration))
                            .rotationEffect(.degrees(Double(item) * 30), anchor: .bottom)
                            .animation(Animation.easeIn(duration: 2).repeatForever(autoreverses: false))
                            .task {
                                acceleration = 300
                        }
                        
                        Capsule()
                            .frame(width: 3, height: 6)
                            .foregroundColor(.red)
                            .hueRotation(.degrees(Double(item) *  30))
                            .blendMode(.exclusion)
                            .offset(y: CGFloat(acceleration))
                            .rotationEffect(.degrees(Double(item) * 30), anchor: .bottom)
                            .animation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false))
                            .task {
                                acceleration = 300
                        }
                    }
                }
            
                else {
                    // Fallback on earlier versions
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
