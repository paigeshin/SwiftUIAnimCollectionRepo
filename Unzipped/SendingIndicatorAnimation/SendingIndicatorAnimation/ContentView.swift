//
//  ContentView.swift
//  SendingIndicatorAnimation
//
//  Created by Amos Gyamfi on 15.7.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var moveLeftRight = 25
    @State private var trimStroke = false
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 200, height: 10)
                    .foregroundColor(Color(.systemGray4))
                
                if #available(iOS 15.0, *) {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 150, height: 10)
                        .foregroundColor(Color(.systemGreen))
                        .clipShape(Rectangle().offset(x: trimStroke ? -100 : 100))
                        .animation(Animation.easeInOut(duration: 0.5).repeatCount(10, autoreverses: true))
                        .offset(x: CGFloat(moveLeftRight))
                        .animation(Animation.easeInOut(duration: 0.5).repeatCount(10, autoreverses: true))
                        .task {
                            moveLeftRight = -25
                            trimStroke.toggle()
                        }
                } else {
                    // Fallback on earlier versions
                }
            }
            
            Text("Sending...")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
