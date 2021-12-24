//
//  ContentView.swift
//  FoldAnimation
//
//  Created by Amos Gyamfi on 29.4.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var scaleX = false
    @State private var scaleY = false
    
    var body: some View {
        VStack {
            
            Text("SwiftUI Fold/Unfold Animation")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
            RoundedRectangle(cornerRadius: 12.5)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .scaleEffect(x: scaleX ? 1 : 0.5)
                .animation(Animation.interpolatingSpring(stiffness: 170, damping: 15))
                .scaleEffect(y: scaleY ? 1 : 0.5)
                .animation(Animation.interpolatingSpring(stiffness: 170, damping: 15).delay(0.3))
                .onTapGesture {
                    scaleX.toggle()
                    scaleY.toggle()
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
