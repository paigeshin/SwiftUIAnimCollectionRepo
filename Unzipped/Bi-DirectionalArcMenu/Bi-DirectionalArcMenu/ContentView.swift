//
//  ContentView.swift
//  Bi-DirectionalArcMenu
//
//  Created by Amos Gyamfi on 25.2.2021.
//

import SwiftUI

struct ContentView: View {
    
    // Initial animation states
    @State private var FABAngle = false
    @State private var iconPosition = false
    
    var body: some View {
        ZStack {
            
            Text("Floating Action Button Animation/Interaction")
                .font(.title)
            
                ZStack {
                    
                    // Hidden motion path
                    Circle()
                        .stroke()
                        .frame(width: 150, height: 150)
                        .opacity(0)
                    
                    Image(systemName: "circle.bottomhalf.fill")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .offset(x: -75)
                        .rotationEffect(.degrees(iconPosition ? 0 : -90))
                        .animation(Animation.easeInOut(duration: 1).delay(0.3))
                    
                    Image(systemName: "circle.dashed.inset.fill")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .offset(x: -75)
                        .rotationEffect(.degrees(iconPosition ? 30 : -90))
                        .animation(Animation.easeInOut(duration: 1).delay(0.2))
                    
                    Image(systemName: "target")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .offset(x: -75)
                        .rotationEffect(.degrees(iconPosition ? 60 : -90))
                        .animation(Animation.easeInOut(duration: 1).delay(0.1))
                    
                    Image(systemName: "circle.tophalf.fill")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .offset(x: -75)
                        .rotationEffect(.degrees(iconPosition ? 90 : -90))
                        .animation(Animation.easeInOut(duration: 1))
                    
                    
                    // From right
                    Image(systemName: "circle.dashed.inset.fill")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .offset(x: -75)
                        .rotationEffect(.degrees(iconPosition ? 120 : 250))
                        .animation(Animation.easeInOut(duration: 1).delay(0.1))
                    
                    Image(systemName: "target")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .offset(x: -75)
                        .rotationEffect(.degrees(iconPosition ? 150 : 250))
                        .animation(Animation.easeInOut(duration: 1).delay(0.2))
                    
                    Image(systemName: "circle.tophalf.fill")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .offset(x: -75)
                        .rotationEffect(.degrees(iconPosition ? 180 : 250))
                        .animation(Animation.easeInOut(duration: 1).delay(0.3))
                    
                }
                .frame(width: 300, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color(#colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)))
                .clipShape(Rectangle().offset(x: -20, y: -80))
                .offset(x: -5, y: 335)
          
            VStack {
                
                Spacer()
                
                HStack {
                    
                   
                    
                    ZStack {
                        
                        // Floating Action Button
                        Circle()
                            .frame(width: 56, height: 56)
                            .foregroundColor(Color(.systemIndigo))
                            .overlay(Image(systemName: "plus")
                                        .rotationEffect(.degrees(FABAngle ? 45 : 0)))
                            .animation(Animation.timingCurve(0.68, -0.6, 0.32, 1.6).delay(0.25))
                            .shadow(color: .black, radius: 10, x: 1, y: 1)
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
