//
//  ContentView.swift
//  LockScreen
//
//  Created by Amos Gyamfi on 23.10.2020.
//

import SwiftUI

struct ContentView: View {
    // Initial color rotation of the background image
    @State private var hueRotate = -360
    
    // Lock icon
    @State private var locked = false
    
    // Initial states for "Swipe up to open"
    @State private var moveText = 45
    @State private var dismissText = 1.0
    
    // Initial state for home indicator
    @State private var moveHomeIndicator = -30
    @Namespace private var matchLockPosition
    
    var body: some View {
        ZStack {
            Image("Background")
                .resizable()
                .ignoresSafeArea(.all)
                .hueRotation(.degrees(Double(hueRotate))) // Cycle between initial and final color rotations
                .animation(Animation.easeInOut(duration: 10).repeatForever(autoreverses: true).speed(0.5)) // Animations that happen at the same time
                .onAppear() {
                    
                    // Final color rotation of the background image
                    hueRotate = 360
                }
            
            VStack {
                
                // Lock Animation
                Group{
                    if locked {
                        Image(systemName: "lock.fill")
                            .font(.title)
                            // Ensuring smooth transition using matched geometry effect
                            .matchedGeometryEffect(id: "lockPosition", in: matchLockPosition)
                    }
                    else {
                        Image(systemName: "lock.open.fill")
                            .font(.title)
                            // Ensuring smooth transition using matched geometry effect
                            .matchedGeometryEffect(id: "lockPosition", in: matchLockPosition)
                            
                    }
                }
                .onAppear() {  // Swap lock icons
                    withAnimation(Animation.easeInOut(duration: 0.5).delay(5).repeatForever(autoreverses: true).speed(2)) {
                        locked.toggle()
                    }
                }
               
                // Current time
                Text(Date().addingTimeInterval(.leastNormalMagnitude), style: .time)
                    .font(.system(size: 58))
                    .fontWeight(.thin)
                
                // Today's date
                Text(Date().addingTimeInterval(.leastNonzeroMagnitude), style: .date)
                    .font(.title3)
                
                Spacer()
                
                HStack {
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.black)
                        .opacity(0.2)
                        .overlay(Image(systemName: "flashlight.off.fill").font(.title2))
                    
                    Spacer()
                    
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.black)
                        .opacity(0.2)
                        .overlay(Image(systemName: "camera.fill").font(.title2))
                    
                }.padding(.horizontal, 46)
            } // Parent container for lock icon, time and date
            
            // Swipe Animations
            VStack {
                
                Spacer()
                
                // Text animations
                Text("Swipe up to open")
                    .opacity(dismissText)
                    .offset(y: CGFloat(moveText))
                    .onAppear() {
                        withAnimation(Animation.easeInOut(duration: 1).delay(2).repeatForever(autoreverses: false).speed(0.5)) {
                            moveText = -35
                            dismissText = 0.5
                        }
                    }
                
                // Home indicator
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 140, height: 4, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .offset(y: CGFloat(moveHomeIndicator))
                    .onAppear() {
                        withAnimation(Animation.easeOut(duration: 0.5).delay(1).repeatForever(autoreverses: true).speed(0.5)) {
                            moveHomeIndicator = 0
                        }
                    }
                    
            } // // Parent container for bottom text and rectangle
                .padding(.vertical, -25)
            
        } // Parent container for all views
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
