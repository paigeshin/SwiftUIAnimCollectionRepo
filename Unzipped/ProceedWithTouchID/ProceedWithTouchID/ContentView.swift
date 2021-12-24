//
//  ContentView.swift
//  ProceedWithTouchID
//
//  Created by Amos Gyamfi on 13.2.2021.
//

import SwiftUI

struct ContentView: View {
    
    // Initial animation states
    @State private var showThumb = 100
    @State private var drawRing = 1/99
    @State private var showCircle = 0
    @State private var rotateCheckMark = 30
    @State private var showCheckMark = -60
    
    
    
    var body: some View {
        VStack(spacing: 100) {
            Text("Proceed with TouchID")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
            ZStack {
                // Inactive
                Circle()
                    .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
                    .frame(width: 126, height: 126, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color(.systemGray3))
                
                // Active
                Circle()
                    .trim(from: 0, to: CGFloat(drawRing))
                    .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
                    .frame(width: 126, height: 126, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .rotationEffect(.degrees(-90))
                    .foregroundColor(Color(.systemTeal))
                    .animation(Animation.easeInOut(duration: 1).delay(1))
                
                Image(systemName: "touchid")
                    .font(.system(size: 80))
                    .foregroundColor(Color(.systemGray3))
                
                Image(systemName: "touchid")
                    .font(.system(size: 80))
                    .foregroundColor(Color(.systemPink))
                    .clipShape(Rectangle().offset(y: CGFloat(showThumb)))
                    .animation(Animation.easeInOut(duration: 1))
               
                // Green circle
                Circle()
                    .frame(width: 110, height: 110, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color(.systemTeal))
                    .scaleEffect(CGFloat(showCircle))
                    .animation(Animation.interpolatingSpring(stiffness: 170, damping: 15).delay(2))
                
                // Ckeckmark
                Image(systemName: "checkmark")
                    .font(.system(size: 60))
                    .rotationEffect(.degrees(Double(rotateCheckMark)))
                    .clipShape(Rectangle().offset(x: CGFloat(showCheckMark)))
                    .animation(Animation.interpolatingSpring(stiffness: 170, damping: 15).delay(2.5))
            }
            .onLongPressGesture {
                
                // Final animation states
                showThumb = 0
                drawRing = 1
                showCircle = 1
                rotateCheckMark = 0
                showCheckMark = 0
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
