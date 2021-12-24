//
//  ContentView.swift
//  Weather Notifications Animation
//
//  Created by Amos Gyamfi on 18.5.2021.
//

import SwiftUI

struct ContentView: View {
    
    // 1. Change background color depending on the time ofthe day
    @State private var rotateChroma = 0
    
    // 2. Bell icon animation
    @State private var rotatBell = -15
    @State private var moveClapper = 12.0
    
    // 3. Sun's rise and fall movement
    @State private var minRise = 0
    @State private var maxRise = 0
    @State private var minFall = 0
    @State private var maxFall = 0
    
    // 4. Show and remove morning, afternoon and evening texts
    @State private var showMorning = 0
    @State private var removeMorning = 1
    @State private var showAfternoon = 0
    @State private var removeAfternoon = 1
    @State private var showEvening = 0
    @State private var removeEvening = 1
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)) // 1. Content background color
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .hueRotation(.degrees(Double(rotateChroma)))
                .animation(Animation.easeOut(duration: 16).delay(6))
                .onAppear() {
                    rotateChroma = 270
                }
            
            VStack {
                
                Text("Never miss the weather")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                ZStack {
                    
                    Circle() // Dashed semi circle
                        .trim(from: 1/2, to: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                        .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round, dash: [7, 7]))
                        .frame(width: 340, height: 340, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.yellow)
                    
                    HStack { // Dots
                        Circle()
                            .frame(width: 10, height: 10)
                        
                        Spacer()
                        
                        Circle()
                            .frame(width: 10, height: 10)
                    }.padding(.horizontal, 23)
                     .foregroundColor(Color(#colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)))
                    
                    
                    HStack { // 3. Sun icon
                        Image(systemName: "sun.max.fill")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color(#colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)))
                            .offset()
                    
                        Spacer()
                        
                    }.padding(.horizontal, 11)
                     .rotationEffect(.degrees(Double(minRise)))
                     .animation(Animation.easeInOut(duration: 2).delay(4))
                     .rotationEffect(.degrees(Double(maxRise)))
                     .animation(Animation.easeInOut(duration: 2).delay(8))
                     .rotationEffect(.degrees(Double(minFall)))
                     .animation(Animation.easeInOut(duration: 2).delay(12))
                     .rotationEffect(.degrees(Double(maxFall)))
                     .animation(Animation.easeInOut(duration: 2).delay(16))
                     .onAppear() {
                        
                        // Final states of sun's movement must sum up to 180°
                        minRise = 30
                        maxRise = 60
                        minFall = 60
                        maxFall = 30
                      
                    }
                    
                    // 2. Bell icon
                    ZStack {
                        VStack(spacing: 12) {
                            Circle()  // Hinge
                                .frame(width: 5, height: 5, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .foregroundColor(Color(#colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)))
                                        
                            Circle() // Clapper
                                .frame(width: 8, height: 8, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .foregroundColor(Color(#colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)))
                                .rotationEffect(.degrees(0), anchor: .top)
                                .offset(x: CGFloat(moveClapper))
                                .animation(Animation.interpolatingSpring(stiffness: 170, damping: 5).repeatForever(autoreverses: false))
                        }
                                    
                            Image("body") // Body of bell icon
                                .rotationEffect(.degrees(Double(rotatBell)), anchor: .top)
                                .shadow(radius: 4 )
                                .animation(Animation.interpolatingSpring(stiffness: 170, damping: 5).repeatForever(autoreverses: false))
                    }
                    .scaleEffect(1.5)
                    .onAppear() {
                        rotatBell = 15
                        moveClapper = -2.5
                            }
                    
                    VStack(spacing: 20) { // 4. Text animations
                        
                        Text("Afternoon")
                            .scaleEffect(CGFloat(showAfternoon))
                            .animation(Animation.easeInOut(duration: 2).delay(9))
                            .opacity(Double(removeAfternoon))
                            .animation(Animation.easeOut(duration: 1).delay(12))
                        
                        HStack {
                            Text("Morning")
                                .scaleEffect(CGFloat(showMorning), anchor: .leading)
                                .animation(Animation.easeInOut(duration: 2).delay(5))
                                .opacity(Double(removeMorning))
                                .animation(Animation.easeOut(duration: 1).delay(8))
                            
                            Spacer()
                            
                            Text("Evening")
                                .scaleEffect(CGFloat(showEvening), anchor: .trailing)
                                .animation(Animation.easeInOut(duration: 2).delay(13))
                                .opacity(Double(removeEvening))
                                .animation(Animation.easeOut(duration: 1).delay(16))
                            
                        }.frame(width: 250, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                    .offset(y: -105)
                    .onAppear() {
                        showMorning = 1
                        removeMorning = 0
                        
                        showAfternoon = 1
                        removeAfternoon = 0
                        
                        showEvening = 1
                        removeEvening = 0
                        
                            }
                }
                
                Spacer()

                Text("We will send you notifications in the morning, afternoon and evening")
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                RoundedRectangle(cornerRadius: 24)
                    .frame(width: 260, height: 48, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .overlay(Text("Enable daily notifications"))
                
                Text("No, thanks")
                
                Spacer()
                
            }.padding()
        } // All views
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
