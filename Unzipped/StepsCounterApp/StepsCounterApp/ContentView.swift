//
//  ContentView.swift
//  StepsCounterApp
//
//  Created by Amos Gyamfi on 15.2.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var walking = false
    @State var drawProgress = 1/999
    @State var totalTime = Text("0:00")
    @State var heartbeat = 1.0
    @State var burning = 0.0
    @State var untapped = Text("Start")
    
    var body: some View {
        VStack {
            ZStack {
                
                // Inactive
                Circle()
                    .stroke(lineWidth: 4)
                    .frame(width: 300, height: 300)
                    .foregroundColor(Color(.systemGray6))
                
                // Active Ring
                Circle()
                    .trim(from: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, to: CGFloat(drawProgress))
                    .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
                    .frame(width: 300, height: 300)
                    .foregroundColor(Color(.systemBlue))
                    .rotationEffect(.degrees(-90))
                    .animation(Animation.easeInOut(duration: 180).delay(0.1).repeatForever(autoreverses: false))
                
                VStack(spacing: 20) {
                    
                    Text(Date().addingTimeInterval(600), style: .date)
                    
                    HStack {
                        Image(systemName: "clock")
                            .font(.title)
                        
                        totalTime
                            .font(.largeTitle)
                    }
                    
                    Text("Goal: 10000")
                }
               
                
            }
            
            Spacer()
            
            HStack(spacing: 50) {
                VStack(spacing: 10) {
                    
                    Text("Measuring..")
                        .font(.caption2)
                    
                    Image(systemName: "heart.fill")
                        .foregroundColor(Color(.systemRed))
                        .scaleEffect(CGFloat(heartbeat))
                        .animation(Animation.interpolatingSpring(stiffness: 170, damping: 5).delay(-0.5).repeatForever(autoreverses: false).speed(2))
                    
                    Text("72 BPM, 5m ago")
                        .font(.caption2)
                }
                
                VStack {
                    HStack {
                        Image("foot_left")
                            .rotation3DEffect(
                                .degrees(walking ? 25 : -25),
                                axis: (x: 1, y: 0, z: 0), anchor: .center)
                            .animation(Animation.easeOut(duration: 0.5).delay(0.1).repeatForever(autoreverses: true))
                           
                        Image("foot_right")
                            .rotation3DEffect(
                                .degrees(walking ? -25 : 25),
                                axis: (x: 1, y: 0, z: 0), anchor: .center)
                            .animation(Animation.easeInOut(duration: 0.5).delay(0.1).repeatForever(autoreverses: true))
                           
                    }
                    
                    Text("Steps: 0.0")
                        .font(.caption2)
                        
                }
                
                
                VStack(spacing: 10) {
                    
                    Text("Measuring..")
                        .font(.caption2)
                    
                    Image(systemName: "flame.fill")
                        .clipShape(Rectangle().offset(y: CGFloat(burning)))
                        .foregroundColor(Color(.systemRed))
                        .animation(Animation.interpolatingSpring(stiffness: 70, damping: 5).repeatForever(autoreverses: true).speed(20))
                    
                    Text("373 kcal, yesterday")
                        .font(.caption2)
                }
                
            }
            
            Spacer()
            
            HStack {
                
                Text("Cancel")
                
                RoundedRectangle(cornerRadius: 23)
                    .frame(width: 150, height: 46)
                    .foregroundColor(Color(.systemBlue))
                    .overlay(untapped)
                    .onTapGesture
                    {
                        walking.toggle()
                        drawProgress = 1
                        totalTime = Text(Date().addingTimeInterval(0.0), style: .timer)
                            .font(.largeTitle)
                        heartbeat = 2
                        burning = 10.0
                        untapped = Text("Stop")
                    }
                
            }
        } // Container for all views
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
