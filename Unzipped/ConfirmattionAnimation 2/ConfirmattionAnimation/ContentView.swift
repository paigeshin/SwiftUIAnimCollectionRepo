//
//  ContentView.swift
//  ConfirmattionAnimation
//
//  Created by Amos Gyamfi on 8.8.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var buttonTransparectcy = 1
    @State private var showCircle = 0
    @State private var removeInnerFill = 45
    @State private var showCheckmark = 0
    @State private var rotate3D = -180
    
    
    var body: some View {
        if #available(iOS 15.0, *) {
            ZStack {
                Path { path in
                    path.move(to: CGPoint(x: -1, y: -1))
                           path.addCurve(to: CGPoint(x: 21, y: 26), control1: CGPoint(x: -1, y: -1), control2: CGPoint(x: 22, y: 26))
                           path.addCurve(to: CGPoint(x: 56, y: -28), control1: CGPoint(x: 20, y: 26), control2: CGPoint(x: 56, y: -28))
                           path.move(to: CGPoint(x: -1, y: -1))

                }
                .trim(from: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, to: CGFloat(showCheckmark))
                .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .round, lineJoin: .round))
                .offset(x: 130, y: 279)
                .animation(Animation.easeInOut(duration: 1).delay(2))
                
                Circle()
                    .strokeBorder(lineWidth: CGFloat(removeInnerFill))
                    .animation(Animation.easeInOut(duration: 1).delay(0.25))
                    .frame(width: 120, height: 120)
                    .foregroundColor(.mint)
                    .scaleEffect(Double(showCircle))
                    .animation(Animation.interpolatingSpring(stiffness: 170, damping: 15).delay(0.1))
                    .rotation3DEffect(
                        .degrees(Double(rotate3D)),
                        axis: (x: 15, y: 15, z: 0.0))
                    .animation(Animation.timingCurve(1.000, -0.600, 1.000, 1.635).speed(0.2).delay(1.25))
                    //.animation(Animation.easeInOut(duration: 1).delay(1.25))
                
                
                    Text("Confirm")
                        .buttonStyle(.borderedProminent)
                        .opacity(Double(buttonTransparectcy))
                        .onTapGesture {
                            showCircle = 1
                            buttonTransparectcy = 0
                            removeInnerFill  = 4
                            rotate3D = 180
                            showCheckmark = 1
                        }
            }
            
            
        } else {
            // Fallback on earlier versions
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
