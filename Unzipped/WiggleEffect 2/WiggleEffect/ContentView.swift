//
//  ContentView.swift
//  WiggleEffect
//
//  Created by Amos Gyamfi on 16.3.2021.
//

import SwiftUI

struct ContentView: View {
    
    // Initial rotation angles
    
    @State private var wiggleWeather = 0.0
    @State private var wiggleCalendar = 2.5
    
    let weatherBg = LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.4620226622, green: 0.8382837176, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
    
    var body: some View {
        ZStack {
            
            Image("bg")
                .ignoresSafeArea()
                .opacity(0.8)
                .blur(radius: 30)
                
            
            HStack(spacing: 40){
                
                ZStack { // Calendar
                    
                    VStack(alignment: .leading) {
                        Text("Wednesday")
                        
                        Text("17")
                            .font(.system(size: 33))
                        
                        Spacer()
                        Text("No more events today")
                            .frame(width: 150, height: 45, alignment: .leading)
                            .multilineTextAlignment(.leading)
                    }
                    .padding()
                    .background(Color.black)
                    .cornerRadius(22)
                    .foregroundColor(.white)
                    
                }
                .frame(width: 170, height: 170, alignment: .leading)
                .overlay(Image(systemName: "minus.circle.fill")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color(.systemGray))
                            .offset(x: -80, y: -80))
                .rotationEffect(.degrees(wiggleCalendar))
                .rotation3DEffect(.degrees(5), axis: (x: 0, y: -5, z: 0))
                .animation(Animation.easeInOut(duration: 0.15).repeatForever(autoreverses: true))
                .onAppear() {
                     // Final rotation angle
                    wiggleCalendar = 0.0
                }
                
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
                    
                }.frame(width: 170, height: 170, alignment: .leading)
                .overlay(Image(systemName: "minus.circle.fill")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color(.systemGray))
                            .offset(x: -80, y: -80))
                .rotationEffect(.degrees(wiggleWeather))
                .rotation3DEffect(.degrees(5), axis: (x: 0, y: -5, z: 0))
                .animation(Animation.easeInOut(duration: 0.15).repeatForever(autoreverses: true))
                .onAppear() {
                     // Final rotation angle
                    wiggleWeather = 2.5
                }
            }
        } // Container for all views
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
