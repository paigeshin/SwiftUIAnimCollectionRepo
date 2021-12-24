//
//  ContentView.swift
//  ArcMenu
//
//  Created by Amos Gyamfi on 17.2.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var FABAngle = false
    @State private var iconPosition = false
    
    var body: some View {
        ZStack {
            
            Text("SwiftUI Arc Menu")
                .font(.largeTitle)
            
                ZStack {
                    Circle()
                        .stroke()
                        .frame(width: 150, height: 150)
                        .opacity(0)
                    
                    Image(systemName: "circle.bottomhalf.fill")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .offset(x: -75)
                        .rotationEffect(.degrees(iconPosition ? 0 : -180))
                        .animation(Animation.easeInOut(duration: 1).delay(0.3))
                    
                    Image(systemName: "circle.dashed.inset.fill")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .offset(x: -75)
                        .rotationEffect(.degrees(iconPosition ? 30 : -180))
                        .animation(Animation.easeInOut(duration: 1).delay(0.2))
                    
                    Image(systemName: "target")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .offset(x: -75)
                        .rotationEffect(.degrees(iconPosition ? 60 : -180))
                        .animation(Animation.easeInOut(duration: 1).delay(0.1))
                    
                    Image(systemName: "circle.tophalf.fill")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .offset(x: -75)
                        .rotationEffect(.degrees(iconPosition ? 90 : -180))
                        .animation(Animation.easeInOut(duration: 1))
                }
                .clipShape(Rectangle().offset(x: -20, y: -50))
                .offset(x: 150, y: 335)
          
            VStack {
                
                Spacer()
                
                HStack {
                    
                    Spacer()
                    
                    ZStack {
                        
                        // FAB Icon
                        Circle()
                            .frame(width: 56, height: 56)
                            .foregroundColor(Color(.systemIndigo))
                            .overlay(Image(systemName: "plus")
                                        .rotationEffect(.degrees(FABAngle ? 45 : 0)))
                            .animation(Animation.timingCurve(0.68, -0.6, 0.32, 1.6).delay(0.25))
                            .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 1, y: 1)
                            .onTapGesture {
                                FABAngle.toggle()
                                iconPosition.toggle()
                        }
                    }
                }
                .padding()
            }
        }// All views
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
