//
//  ContentView.swift
// Facebook Live Comments Animation
//
//  Created by Amos Gyamfi on 30.10.2020.
//

import SwiftUI

struct ContentView: View {
    
    // Initial Swing angle
    @State private var swingAngle = -5
    
    // Comments initial positions
    @State private var firstCommentPosition = 250
    @State private var secondCommentPosition = -50
    // Make comment visible
    @State private var hideComment = 1
    
    // Initial hue rotation angle
    @State private var colorAngle = -120
    
    var body: some View {
        VStack(spacing: 30) {
            
            HStack(alignment: .top) {
                
                // Live button
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: 64, height: 32, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color(.systemPink))
                    .overlay(Text("LIVE"))
                
                // Number of watching
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: 84, height: 32, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color(.systemGray6))
                    .overlay(Label("4.5k", systemImage: "eye.fill"))
                   
                
                Spacer()
                
                // Today's date
                Text("").font(.system(.headline)).foregroundColor(Color(.systemBlue)) + Text(Date().addingTimeInterval(.leastNormalMagnitude), style: .date)
                    .font(.caption)
                           
                // Current time
                Text("").font(.system(.headline)).foregroundColor(Color(.systemBlue)) + Text(Date().addingTimeInterval(.leastNonzeroMagnitude), style: .time)
                    .font(.caption)
            }
            .padding(.horizontal)
            
            ZStack {
                Image("photo")
                    .hueRotation(.degrees(Double(colorAngle))) // Change the color of landscape
                    .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                    .onAppear()
                    {
                        colorAngle = 60
                    }
                
                Image("kid")
                    .rotation3DEffect(
                        .degrees(Double(swingAngle)),
                        axis: (x: 1, y: 0.0, z: 0.0), anchor: .top)
                    .offset(y: -30)
                    .animation(Animation.easeOut(duration: 2).repeatForever(autoreverses: true))
                    .onAppear()
                    {
                        swingAngle = 25
                    }
                
                VStack {
                    
                    Spacer()
                    
                    HStack {
                        
                        // Contents from MovingComments file
                        MovingComments()
                            .offset(y: CGFloat(firstCommentPosition))
                            .onAppear() {
                                withAnimation(Animation.easeInOut(duration: 0.2)) {
                                   firstCommentPosition = 180
                               }
                           }
                        
                        Spacer()
                    }
                    .padding(.horizontal, 30)
                    .opacity(Double(hideComment))
                    .onAppear() {
                        withAnimation(Animation.easeInOut(duration: 1).delay(6)) {
                        hideComment = 0
                       }
                   }
                }.scaleEffect(1, anchor: .top)
                
                .offset(y: CGFloat(secondCommentPosition))
                 .onAppear() {
                    
                    withAnimation(Animation.easeInOut(duration: 2).delay(3)) {
                        secondCommentPosition = -400
                    }
                }
        
            }
            .frame(width: 400, height: 350)
            .clipShape(Rectangle()) // Mask views
            
            Comments()
        } // Parent container for all views
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
