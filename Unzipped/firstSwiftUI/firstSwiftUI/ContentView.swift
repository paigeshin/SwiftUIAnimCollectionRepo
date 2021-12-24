//
//  ContentView.swift
//  firstSwiftUI
//
//  Created by Amos Gyamfi on 29.1.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var transparency = false
         
    
    var body: some View {
        Text("First SwiftUI")
            .font(.largeTitle)
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            .scaleEffect(transparency ? 0 : 1)
            .animation(Animation.spring().repeatForever(autoreverses: true))
            .onAppear(){
                transparency.toggle()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
