//
//  ContentView.swift
//  FaceBook_Notification
//
//  Created by Amos Gyamfi on 8.4.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var rotatBell = -15
    @State private var moveClapper = 15.0
    
    var body: some View {
        VStack {  // Container for all views
            
            Text("Enable Notifications")
                .font(.title)
            
            Spacer()
            
            ZStack {
                VStack(spacing: 25) {
                    Circle()  // Hinge
                        .frame(width: 10, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color(#colorLiteral(red: 0, green: 0.9921568627, blue: 1, alpha: 1)))
                    
                    Circle() // Clapper
                        .frame(width: 16, height: 16, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color(#colorLiteral(red: 0, green: 0.9921568627, blue: 1, alpha: 1)))
                        .rotationEffect(.degrees(0), anchor: .top)
                        .offset(x: CGFloat(moveClapper))
                        .animation(Animation.interpolatingSpring(stiffness: 170, damping: 5).repeatForever(autoreverses: false))
                        
                       
                }
                
                Image("bell") // Body
                    .shadow(radius: 4 )
                    .rotationEffect(.degrees( Double(rotatBell)), anchor: .top)
                    .animation(Animation.interpolatingSpring(stiffness: 170, damping: 5).repeatForever(autoreverses: false))
                    
            }
            .onAppear() {
                rotatBell = 15
                moveClapper = -10
        }
            
            Spacer()
            
            RoundedRectangle(cornerRadius: 23)
                .frame(width: 200, height: 46)
                .foregroundColor(Color(#colorLiteral(red: 0.8710535169, green: 0.6577057838, blue: 0.3149542511, alpha: 1)))
                .overlay(Text("Ok").foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))))
            
            RoundedRectangle(cornerRadius: 23)
                .frame(width: 200, height: 46)
                .overlay(Text("Maybe later").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/))
        } // Container for all views
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
