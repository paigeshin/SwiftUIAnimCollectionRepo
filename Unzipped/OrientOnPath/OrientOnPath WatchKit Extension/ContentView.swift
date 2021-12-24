//
//  ContentView.swift
//  OrientOnPath WatchKit Extension
//
//  Created by Amos Gyamfi on 21.1.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var moveOnPath = false
    @State var swingParentPath = false
    
    var body: some View {
        
        ZStack {
            Circle()
                .stroke()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            Circle()
                .frame(width: 15, height: 15, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .offset(x: -50)
                .rotationEffect(.degrees(moveOnPath ? 0 : 360))
                .animation(Animation.linear(duration: 4).repeatForever(autoreverses: false))
                .onAppear() {
                    moveOnPath.toggle()
                }
               
        }
        .rotation3DEffect(
            .degrees(70),
            axis: (x: 10, y: swingParentPath ? 2 : -2, z: 0.0))
        .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
        .onAppear() {
            swingParentPath.toggle()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
