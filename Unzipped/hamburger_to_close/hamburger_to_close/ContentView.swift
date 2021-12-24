//
//  ContentView.swift
//  hamburger_to_close
//
//  Created by Amos Gyamfi on 30.3.2021.
//

import SwiftUI

struct ContentView: View {
    
        @State private var topRotates = false
        @State private var middleIsHidden = false
        @State private var bottomRotates = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 14){
                    
                    Rectangle() // top
                        .frame(width: 64, height: 10)
                        .cornerRadius(4)
                        .rotationEffect(.degrees(topRotates ? 48 : 0), anchor: .leading)
                    
                    Rectangle() // middle
                        .frame(width: 64, height: 10)
                        .cornerRadius(4)
                        .scaleEffect(middleIsHidden ? 0 : 1, anchor: .trailing)
                        .opacity(middleIsHidden ? 0 : 1)
                    
                    Rectangle() // bottom
                        .frame(width: 64, height: 10)
                        .cornerRadius(4)
                        .rotationEffect(.degrees(topRotates ? -48 : 0), anchor: .leading)
                    
                }
                .animation(Animation.interpolatingSpring(stiffness: 300, damping: 15))
                .onTapGesture {
                    topRotates.toggle()
                    middleIsHidden.toggle()
                    bottomRotates.toggle()
        }
                
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
