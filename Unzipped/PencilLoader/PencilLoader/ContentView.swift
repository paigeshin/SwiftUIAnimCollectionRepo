//
//  ContentView.swift
//  PencilLoader
//
//  Created by Amos Gyamfi on 7.8.2021.
//

import SwiftUI

struct ContentView: View {
   
    @State private var rotate = -135
    @State private var drawErase = 0
    
    var body: some View {
        ZStack {
            if #available(iOS 15.0, *) {
                Circle()
                    .trim(from: 0, to: CGFloat(drawErase))
                    .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
                    .frame(width: 64, height: 64)
                    .animation(Animation.timingCurve(0.68, -0.6, 0.32, 1.6).speed(0.2).repeatForever(autoreverses: true))
                    /*.animation(Animation.easeInOut(duration: 1).delay(1).repeatForever(autoreverses: true))*/
                    .task {
                        rotate = 405
                        drawErase = 1
                    }
                    
            } else {
                // Fallback on earlier versions
            }
            
            if #available(iOS 15.0, *) {
                Image(systemName: "applepencil")
                    .font(.system(size: 64))
                    .foregroundColor(Color.indigo)
                    .rotationEffect(.degrees(Double(rotate)))
                    .animation(Animation.timingCurve(0.68, -0.6, 0.32, 1.6).speed(0.2).repeatForever(autoreverses: true))
                    /*.animation(Animation.easeInOut(duration: 1).delay(1).repeatForever(autoreverses: true))*/
                    
            } else {
                // Fallback on earlier versions
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
