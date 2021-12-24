//
//  ContentView.swift
//  PassiveIncome
//
//  Created by Amos Gyamfi on 23.3.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var snooring = 0.0
    @State private var rotate = 55
    @State private var moneDropping = -UIScreen.main.bounds.height/1.5
    @State private var rotateMoney = 0
    
    var body: some View {
        VStack(spacing: -40) {
            HStack {
                ZStack {
                    Text("Z")
                        .rotationEffect(.degrees(Double(rotate)))
                        .offset(y: CGFloat(snooring))
                        .animation(Animation.easeIn(duration: 4).delay(1).repeatForever(autoreverses: false))
                        .onAppear()
                        {
                            snooring = -450
                            rotate = -10
                    }
                    
                    Text("Z")
                        .rotationEffect(.degrees(Double(rotate)))
                        .offset(y: CGFloat(snooring))
                        .animation(Animation.easeOut(duration: 4).delay(1).repeatForever(autoreverses: false))
                        .onAppear()
                        {
                            snooring = -400
                            rotate = 10
                    }
                    
                    Text("Z")
                        .rotationEffect(.degrees(Double(rotate)))
                        .offset(y: CGFloat(snooring))
                        .animation(Animation.easeInOut(duration: 4).delay(1).repeatForever(autoreverses: false))
                        .onAppear()
                        {
                            snooring = -500
                            rotate = -20
                    }
                }
                
                Spacer()
                
            }.padding(.horizontal, 130)
            
            Image("sleep")
            
            HStack {
                ZStack {
                    Circle()
                        .trim(from: 0, to: 0)
                        .stroke()
                        .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .overlay(Image(systemName: "dollarsign.circle"))
                        .rotationEffect(.degrees(Double(rotateMoney)))
                        .rotation3DEffect(
                            .degrees(30),
                            axis: (x: 1, y: 0.0, z: 0.0))
                        .foregroundColor(.orange)
                        .offset(y: moneDropping)
                        .animation(Animation.timingCurve(0.55, 0, 1, 0.45).speed(0.1).delay(0.5).repeatForever(autoreverses: false))
                        .onAppear()
                        {
                            moneDropping = -30
                            rotateMoney = 360
                    }
                    
                    Circle()
                        .trim(from: 0, to: 0)
                        .stroke()
                        .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .overlay(Image(systemName: "dollarsign.circle"))
                        .rotationEffect(.degrees(Double(rotateMoney)))
                        .rotation3DEffect(
                            .degrees(30),
                            axis: (x: 1, y: 0.0, z: 0.0))
                        .foregroundColor(.yellow)
                        .offset(y: moneDropping)
                        .animation(Animation.timingCurve(0.55, 0, 1, 0.45).speed(0.1).delay(1).repeatForever(autoreverses: false))
                        .onAppear()
                        {
                            moneDropping = -30
                            rotateMoney = 360
                    }
                }
                
                Spacer()
            }
            .padding(.horizontal, 51)
            
            Text("Make money while you sleep")
            Text("Passive Income:")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
