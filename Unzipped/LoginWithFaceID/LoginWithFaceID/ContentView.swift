//
//  ContentView.swift
//  LoginWithFaceID
//
//  Created by Amos Gyamfi on 13.2.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var moveHead = 1.0
    @State private var flipNose = 0
    @State private var blinkEye = 0.5
    @State private var removeFace = 1
    
    // Circles
    @State private var rotate3D = -180
    @State private var rotate3D1 = 180
    @State private var transparency = 0.0
    @State private var blurCircle = 5
    @State private var hueAdjust = 720
    
    @State private var showCheckmark = 0.0
    
    var body: some View {
        ZStack {
            ZStack {
                Image("head")
                    .scaleEffect(CGFloat(moveHead))
                    .animation(Animation.easeInOut(duration: 1).repeatCount(4, autoreverses: true))
                    
                
                VStack {
                    
                    HStack {
                        Image("right_eye")
                            .scaleEffect(y: CGFloat(blinkEye))
                            .animation(Animation.easeOut(duration: 0.25).delay(3).repeatCount(6, autoreverses: true).speed(12))
                        
                        Image("nose")
                            .rotation3DEffect(
                                .degrees(180),
                                axis: (x: 0, y: CGFloat(flipNose), z: 0.0))
                            .animation(Animation.easeInOut(duration: 15).delay(5).repeatCount(3, autoreverses: true).speed(12))
                        
                        Image("left_eye")
                            .scaleEffect(y: CGFloat(blinkEye))
                            .animation(Animation.easeInOut(duration: 1).delay(1.25).repeatCount(8, autoreverses: true).speed(12))
                    }
                    
                    Image("mouth")
                }
            }
            .opacity(Double(removeFace))
            .animation(Animation.easeInOut(duration: 1).delay(4))
            .onAppear() {
                moveHead = 1.2
                blinkEye = 1.0
                flipNose = 1
                removeFace = 0
        }
            
            ZStack {
                Circle()
                    .stroke(lineWidth: 6)
                    .frame(width: 128, height: 128, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color(.systemGreen))
                    .opacity(Double(transparency))
                    .hueRotation(.degrees(Double(hueAdjust)))
                    .blur(radius: CGFloat(blurCircle))
                    .rotationEffect(.degrees(360))
                    .rotation3DEffect(
                        .degrees(Double(rotate3D)),
                        axis: (x: 15, y: 15, z: 0.0))
                    .animation(Animation.easeInOut(duration: 2).delay(4))
                
                Circle()
                    .stroke(lineWidth: 6)
                    .frame(width: 128, height: 128, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color(.systemGreen))
                    .opacity(Double(transparency))
                    .hueRotation(.degrees(Double(hueAdjust)))
                    .blur(radius: CGFloat(blurCircle))
                    .rotationEffect(.degrees(-360))
                    .rotation3DEffect(
                        .degrees(Double(-rotate3D1)),
                        axis: (x: 5, y: -15, z: 0))
                    .animation(Animation.easeInOut(duration: 2).delay(4))
                    
            }
            .blendMode(.hardLight)
            .onAppear(){
                rotate3D = 180
                rotate3D1 = -180
                transparency = 1.0
                blurCircle = 0
                hueAdjust = 0
            }
            
            Path { path in
                path.move(to: CGPoint(x: -1, y: -1))
                       path.addCurve(to: CGPoint(x: 21, y: 26), control1: CGPoint(x: -1, y: -1), control2: CGPoint(x: 22, y: 26))
                       path.addCurve(to: CGPoint(x: 56, y: -28), control1: CGPoint(x: 20, y: 26), control2: CGPoint(x: 56, y: -28))
                path.move(to: CGPoint(x: -1, y: -1))

            }
            .trim(from: 0, to: CGFloat(showCheckmark))
            .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .round, lineJoin: .round))
            .offset(x: 166, y: 386)
            .animation(Animation.easeInOut(duration: 1).delay(5.6))
            .onAppear(){
                showCheckmark = 1.0
            }
           
            
        }
        // All views
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
