//
//  ContentView.swift
//  FocusMeditationAnimation
//
//  Created by Amos Gyamfi on 8.2.2021.
//

import SwiftUI

struct ContentView: View {
    
    // Initial Animation states
    @State private var animateTag = -15.0
    @State private var animateHue = false
    @State private var animateProgress = 0.0
    @State private var animateSmallCircle = false
    @State private var animateLargeCircle = false
    @State private var animateSound = 10
    
    
    let phoneBackground = LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.6823529412, green: 0.8352941176, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.6117647059, green: 0.6078431373, blue: 1, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomLeading)
    
    var body: some View {
        ZStack {
            
            // Background image
            Image("desert")
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .opacity(0.8)
                .blur(radius: 10)
                .hueRotation(.degrees(animateHue ? -120 : 180))
                .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                .onAppear() {
                    animateHue.toggle()
                }
            
            phoneBackground
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .opacity(0.8)
                .blur(radius: 10)
            
            VStack {
               HStack {
                    Image(systemName: "chevron.down.circle.fill")
                        .font(.title)
                    
                    Spacer()
                    
                    Image(systemName: "gear")
                        .font(.title)
                }
                .padding()
                
                ZStack {
                    // Large circle
                    Circle()
                        .stroke()
                        .frame(width: UIScreen.main.bounds.width - 50, height: UIScreen.main.bounds.width - 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .scaleEffect(animateLargeCircle ? 1.2 : 0.73)
                        .opacity(animateLargeCircle ? 0 : 1)
                        .animation(Animation.easeOut(duration: 4).delay(1).repeatForever(autoreverses: false))
                        .onAppear() {
                            animateLargeCircle.toggle()
                        }
                    
                    // Small circle
                    Circle()
                        .stroke()
                        .frame(width: UIScreen.main.bounds.width - 100, height: UIScreen.main.bounds.width - 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .scaleEffect(animateSmallCircle ? 1.2 : 0.84)
                        .opacity(animateSmallCircle ? 0 : 1)
                        .animation(Animation.easeInOut(duration: 4).delay(1).repeatForever(autoreverses: false))
                        .onAppear() {
                            animateSmallCircle.toggle()
                        }
                    
                    Circle() // Inactive
                        .stroke(lineWidth: 4)
                        .frame(width: UIScreen.main.bounds.width - 150, height: UIScreen.main.bounds.width - 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .opacity(0.2)
                    
                    
                    Circle() // Active
                        .trim(from: CGFloat(animateProgress), to: 1)
                        .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
                        .frame(width: UIScreen.main.bounds.width - 150, height: UIScreen.main.bounds.width - 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .rotationEffect(.degrees(-90))
                        .animation(Animation.linear(duration: 300))
                        .onAppear() {
                            animateProgress = 8/9
                        }
                        
                    // Countdown Timer
                    VStack {
                        
                        Text(Date().addingTimeInterval(300), style: .timer)
                            .font(.system(size: 96))
                            .fontWeight(.ultraLight)
                        Label("Focus", systemImage: "record.circle")
                    }
                }
                
                Spacer()
                
                // Pause button
                RoundedRectangle(cornerRadius: 32)
                    .stroke()
                    .frame(width: 120, height: 64, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .overlay(Text("Pause"))
                
                Spacer()
                
                // Bottom
                HStack {
                    VStack {
                        Image(systemName: "tag") // Tag icon
                            .font(.largeTitle)
                            .rotationEffect(.degrees(animateTag), anchor: .topTrailing)
                            .animation(Animation.interpolatingSpring(stiffness: 170, damping: 5).repeatForever(autoreverses: false))
                            .onAppear() {
                                animateTag = 15
                            }
                            
                        
                        Text("Focus Tags")
                    }
                    
                    Spacer()
                    
                    VStack {
                        Image(systemName: "waveform") // Sound icon
                            .font(.largeTitle)
                            .clipShape(Circle().offset(y: CGFloat(animateSound)))
                            .animation(Animation.interpolatingSpring(mass: 0.05, stiffness: 170, damping: 15, initialVelocity: 1).repeatForever(autoreverses: true))
                            .onAppear() {
                                animateSound = -15
                            }
                        
                        Text("Sound Scenes")
                    }
                }
                .padding()
                    
                
            }
            .foregroundColor(.white)
            .padding()
        }  // Container for all views
        
           
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
