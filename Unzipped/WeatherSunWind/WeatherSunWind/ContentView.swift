//
//  ContentView.swift
//  WeatherSunWind
//
//  Created by Amos Gyamfi on 2.3.2021.

import SwiftUI
import MapKit

struct ContentView: View {
    
    // Sun's motion on the circular path
    @State private var projectileMotion = 0
    @State private var spin = 0
    @State private var drawSunPath = 1/3
    
    @State private var city = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 60.16952, longitude: 24.93545), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    var body: some View {
        VStack {
            HStack {
                
                Image(systemName: "line.horizontal.3")
                
                Spacer()
                
                VStack {
                    Text("Helsinki")
                    
                    Text(Date().addingTimeInterval(50), style: .time)
                        .font(.subheadline)
                }
                    
                Spacer()
                
                Image(systemName: "plus")
            }
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .padding()
            
            Map(coordinateRegion: $city, showsUserLocation: true, userTrackingMode: .constant(.follow))
            
            Spacer()
            
            ZStack {
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .frame(width: 360, height: 225, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color(.systemGray5))
                    .rotation3DEffect(
                        .degrees(60),
                        axis: (x: 1, y: 0.0, z: 0.0))
                
                HStack(alignment: .bottom) {
                    VStack(spacing: -6) {
                        Image("blade")
                            .scaleEffect(3)
                            .rotationEffect(.degrees(Double(spin)), anchor: .center)
                            .animation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false))
                            .onAppear() {
                                spin = 360
                            }
                        Image("stand_large")
                    }
                    
                    VStack(spacing: -6) {
                        Image("blade")
                            .scaleEffect(2)
                            .rotationEffect(.degrees(Double(spin)), anchor: .center)
                            .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                            .onAppear() {
                                spin = 360
                            }
                        Image("stand_small")
                    }
                }
                
                Circle()
                    .trim(from: 1/2, to: 1.0)
                    .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round, dash: [7, 7]))
                    .frame(width: 300, height: 300, alignment: .bottom)
                
                Circle()
                    .trim(from: 1/2, to: CGFloat(drawSunPath))
                    .stroke(style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round, dash: [7, 7]))
                    .frame(width: 300, height: 300, alignment: .bottom)
                    .foregroundColor(Color(.systemYellow))
                    .animation(Animation.easeOut(duration: 5).delay(3).repeatForever(autoreverses: false))
                    .onAppear() {
                        drawSunPath = 1
                    }
                
                Image(systemName: "sun.max.fill")
                    .font(.title)
                    .foregroundColor(Color(.systemYellow))
                    .offset(x: -150)
                    .rotationEffect(.degrees(0))
                    .rotationEffect(.degrees(Double(projectileMotion)), anchor: .center)
                    .animation(Animation.easeInOut(duration: 5).delay(3).repeatForever(autoreverses: false))
                    .onAppear() {
                        projectileMotion = 180
                    }
                
                // Labels
                VStack {
                    Text("Sun and Wind")
                        .font(.subheadline)
                    Text("Wind: 0.4m/s SW")
                    Text("Barometer: 1011.9 mBar")
                    
                    Spacer()
                    
                    HStack {
                        Text("6.57")
                        
                        Spacer()
                        
                        Text("17.48")
                    }
            
                    Spacer()
                   
                }
                .font(.caption)
                .padding()
                   
            }
            .padding()
                
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
