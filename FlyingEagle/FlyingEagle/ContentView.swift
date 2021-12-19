//
//  ContentView.swift
//  FlyingEagle
//
//  Created by paige on 2021/12/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var leftWing = false
    @State var rightWing = false
    @State var birdBody = false
    
    var body: some View {
        ZStack {
            Color(red: 0.0, green: 0.0, blue: 0.0)
                .edgesIgnoringSafeArea(.all)
            
            ZStack {
                
                // MARK: - LEFT WING
                Image("leftWing")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .shadow(color: .blue, radius: 1, x: 0, y: 3)
                    .rotationEffect(.degrees(leftWing ? -100 : 0), anchor: .bottomTrailing)
                    .offset(x: -55, y: leftWing ? -190 : 0)
                    .animation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true), value: leftWing)
                
                // MARK: - RIGHT WING
                Image("rightWing")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .shadow(color: .blue, radius: 1, x: 0, y: 3)
                    .rotationEffect(.degrees(rightWing ? 100 : 0), anchor: .bottomLeading)
                    .offset(x: 55, y: rightWing ? -190 : 0)
                    .animation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true), value: rightWing)
                
                // MARK: - BODY
                Image("body2")
                    .resizable()
                    .offset(y: -30)
                    .frame(width: 100, height: 125)
                    .shadow(color: .white, radius: 1)
                    .offset(y: birdBody ? -50 : 75)
                    .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: birdBody)
                
            } //: ZSTACK
            .shadow(color: .white, radius: 1, x: 0, y: 7)
        }
        .onAppear {
            birdBody.toggle()
            leftWing.toggle()
            rightWing.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
