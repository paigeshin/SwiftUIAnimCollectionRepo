//
//  ContentView.swift
//  BatteryChargingAnimation
//
//  Created by Amos Gyamfi on 21.4.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showBoltIcon = 0.0
    @State private var showInactiveCircle = 0.0
    @State private var drawPercentageCharged = 0.1
    @State private var increaseLineWidth = 6
    @State private var showText = 0.0
    @State private var showFilledCircle = 0.0
    @State private var dismissFilledCircle = 1
    
    var body: some View {
        
            ZStack {
                Image("night")
                    .resizable()
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                VStack(spacing: -70) {
                    ZStack {
                        Circle() // Filled circle
                            .frame(width: 400, height: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .scaleEffect(CGFloat(showFilledCircle))
                            .opacity(Double(dismissFilledCircle))
                            .blur(radius: 0.5)
                            .animation(Animation.easeInOut(duration: 1).delay(1))
                        
                        Circle() // Inactive
                            .stroke(lineWidth: 20)
                            .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .scaleEffect(CGFloat(showInactiveCircle))
                            .opacity(0.25)
                            .blur(radius: 0.5)
                            .animation(Animation.easeInOut(duration: 1))
                            
                        
                        Circle() // Active
                            .trim(from: 1/4, to: CGFloat(drawPercentageCharged))
                            .stroke(style: StrokeStyle(lineWidth: CGFloat(increaseLineWidth) , lineCap: .round, lineJoin: .round))
                            .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color(#colorLiteral(red: 0, green: 0.9810667634, blue: 0.5736914277, alpha: 1)))
                            .rotationEffect(.degrees(-180))
                            .animation(Animation.easeOut(duration: 1).delay(0.7))
                        
                        Image(systemName: "bolt.fill")
                            .font(.system(size: 64))
                            .foregroundColor(Color(#colorLiteral(red: 0, green: 0.9810667634, blue: 0.5736914277, alpha: 1)))
                            .opacity(showBoltIcon)
                            .animation(Animation.easeInOut(duration: 1).delay(0.7))
                    }
                    
                    Text("75% Charged")
                        .scaleEffect(CGFloat(showText))
                        .animation(Animation.interpolatingSpring(stiffness: 170, damping: 10).delay(1))
                    
                } // All animated views
                .onAppear() {
                    showBoltIcon = 1
                    showInactiveCircle = 1.0
                    drawPercentageCharged = 1.0
                    increaseLineWidth = 20
                    showFilledCircle = 1
                    dismissFilledCircle = 0
                    showText = 1
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
