//
//  ContentView.swift
//  AudioMetering
//
//  Created by Amos Gyamfi on 13.2.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var toggleRecordStop = "Record"
    @State var scaleBigger = 0.5
    @State var scaleMedium = 0.5
    @State var scaleSmaller = 0.5
    @State var counter = Text("0.00")
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Text("Audio Metering")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
            Spacer()
            Spacer()
            
            // Put count up timer
           counter
            .font(.system(size: 64))
            .fontWeight(.ultraLight)
            
            Spacer()
            
            ZStack {
                
                Circle()
                    .frame(width: 250, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .scaleEffect(CGFloat(scaleBigger))
                    .foregroundColor(Color(.systemGray6))
                    .animation(Animation.easeOut(duration: 1).repeatForever(autoreverses: true))
                
                Circle()
                    .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .scaleEffect(CGFloat(scaleMedium))
                    .foregroundColor(Color(.systemGray5))
                    .animation(Animation.default.repeatForever(autoreverses: true))
                
                Circle()
                    .frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .scaleEffect(CGFloat(scaleSmaller))
                    .foregroundColor(Color(.systemGray4))
                    .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
                
                // Red circle
                Circle()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color(.systemRed))
                    .overlay(Text(toggleRecordStop))
                    
                    
            }
            .onTapGesture {
                toggleRecordStop = "Stop"
                scaleBigger = 1.2
                scaleMedium = 1.2
                scaleSmaller = 1.2
                counter = Text(Date().addingTimeInterval(0.0), style: .timer)
                    .font(.system(size: 64))
                    .fontWeight(.ultraLight)
               
            }
            
    
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
