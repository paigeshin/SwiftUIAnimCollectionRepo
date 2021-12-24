//
//  ContentView.swift
//  ParallaxEffect
//
//  Created by Amos Gyamfi on 14.05.2021.
//

import SwiftUI
struct ContentView: View {
    
    // Initial States
    @State private var angle = 12
    @State private var rotateX = 90.0
    @State private var rotateY = -45.0
    
    let weatherBg = LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
    
    var body: some View {
        ZStack { // Weather
            
            VStack(alignment: .leading) {
                Text("Wednesday")
                
                Text("18°")
                    .font(.system(size: 44))
                    .fontWeight(.thin)
                
                Spacer()
                Image(systemName: "cloud.sun.fill")
                Text("Partly Cloudy")
                    .frame(width: 150, height: 20, alignment: .leading)
                Text("H:21° L:12°")
                
            }
            .padding()
            .background(weatherBg)
            .cornerRadius(22)
            .foregroundColor(.white)
            
        }
        .frame(width: 170, height: 170, alignment: .leading)
        .rotation3DEffect(
            .degrees(Double(angle)),
            axis: (x: CGFloat(rotateX), y: CGFloat(rotateY), z: 0.0)
        )
        .animation(Animation.timingCurve(0.37, 0, 0.63, 1).speed(0.2).repeatForever(autoreverses: true))
        .onAppear() {
            
            // Final states
            angle = -12
            rotateX = -45.0
            rotateY = -90.0
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
