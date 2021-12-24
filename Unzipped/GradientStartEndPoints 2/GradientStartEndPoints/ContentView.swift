//
//  ContentView.swift
//  GradientStartEndPoints
//
//  Created by Amos Gyamfi on 5.7.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var hueAdjust = false
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.red, Color.green, Color.blue]), startPoint: hueAdjust ? .bottomLeading : .leading,
                endPoint: .top)
                .edgesIgnoringSafeArea(.all)
                .hueRotation(.degrees(hueAdjust ? 0 : 360))
                .opacity(1)
                .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                .onAppear() {
                    hueAdjust.toggle()
            }
            
            
            Text("Rainbow Effect")
                .font(.largeTitle)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0, *) {
            ContentView()
                .previewInterfaceOrientation(.landscapeLeft)
        } else {
            // Fallback on earlier versions
        }
    }
}
