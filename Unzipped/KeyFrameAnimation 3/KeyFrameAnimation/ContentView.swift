//
//  ContentView.swift
//  KeyFrameAnimation
//
//  Created by Amos Gyamfi on 13.8.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var move = 300
    @State private var fadeout = 1
    @State private var propel = 300
    
    var body: some View {
        VStack {
            
            //1. Basic Animation
            VStack(spacing: 0) {
                if #available(iOS 15.0, *) {
                    Image("cybertruck")
                        .offset(x: CGFloat(move))
                        .animation(Animation.easeInOut(duration: 6).delay(2))
                        .task {
                            move = -300
                        }
                } else {
                    // Fallback on earlier versions
                }
                
                Rectangle()
                    .stroke(style: StrokeStyle( dash: [1, 7]))
                .frame(width: 600, height:  1)
            }
                
            VStack(spacing: 20) {
                HStack(spacing: 600) {
                    Text("A")
                    Text("B")
                }
                
                Text("**Basic Animation:** The car propels directly from B to A")
                    .font(.title)
            }
            
            Spacer()
            
            //2. Keyframe Animation
            VStack(spacing: 0) {
                if #available(iOS 15.0, *) {
                    Image("cybertruck")
                        .offset(x: CGFloat(propel))
                        .task {
                            // Initial keyframe: Position DC
                            withAnimation(Animation.easeInOut(duration: 1).delay(2))
                            {
                                propel = 100
                                }
                            
                            // Keyframe 1: Position CB
                            withAnimation(Animation.easeInOut(duration: 1).delay(4))
                            {
                                propel = -100
                                }
                            
                            // Final Keyframe: Position BA
                            withAnimation(Animation.easeInOut(duration: 1).delay(6))
                            {
                                propel = -300
                                }
                        }
                } else {
                    // Fallback on earlier versions
                }
                
                Rectangle()
                    .stroke(style: StrokeStyle( dash: [1, 7]))
                .frame(width: 600, height:  1)
            }
                
            VStack(spacing: 20) {
                HStack(spacing: 190) {
                    Text("A")
                    Text("B")
                    Text("C")
                    Text("D")
                   
                }
                
                Text("**Keyframe-based Animation:** Stops at C & B before coming to rest at A")
                    .font(.title)
            }
            
            Spacer()
            
            //3. Group Animation: The car fades out while it propels
            VStack(spacing: 0) {
                if #available(iOS 15.0, *) {
                    ZStack {
                        Image("cybertruck")
                            .opacity(Double(fadeout))
                            //.animation(Animation.easeInOut(duration: 6).delay(2))
                            //.offset(x: CGFloat(move))
                            //.animation(Animation.easeInOut(duration: 6).delay(2))
                            .task {
                                withAnimation(Animation.easeInOut(duration: 1).delay(6))
                                {
                                    //move = -300
                                    }
                                
                                withAnimation(Animation.easeInOut(duration: 1).delay(6))
                                {
                                    //fadeout = 0
                                    }
                        }
                    }
                    // Overriding individual animation durations
                    //.animation(Animation.easeInOut(duration: 12).delay(2))
                }
                else {
                    // Fallback on earlier versions
                }
                
                Rectangle()
                    .stroke(style: StrokeStyle( dash: [1, 7]))
                .frame(width: 600, height:  1)
            }
                
            VStack(spacing: 20) {
                HStack(spacing: 600) {
                    Text("A")
                    Text("B")
                }
                
                Text("**Group Animation:** The car fades out while it propels")
                    .font(.title)
            }
        }.padding()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0, *) {
            ContentView()
                .preferredColorScheme(.dark)
                .previewInterfaceOrientation(.landscapeLeft)
        } else {
            // Fallback on earlier versions
        }
    }
}
