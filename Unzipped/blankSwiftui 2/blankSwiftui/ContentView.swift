//
//  ContentView.swift
//  blankSwiftui
//
//  Created by Amos Gyamfi on 30.1.2021.
//

import SwiftUI

struct ContentView: View {
    
    // 1. Create a State Variable
    @State var rotateBell = false
    
    var body: some View {
        
        
        // 2. Define how you want the animation to start
        
        // 3. Add the property (modifier) you want to animate
        
        // 4. Use the state variable along with ternary conditional operation to change the property you want to animate
        
        // 5. Add the animation modifier and set its parameters

        Image(systemName: "bell.fill")
            .font(.system(size: 124))
            .rotationEffect(.degrees(rotateBell ? -30 : 30), anchor: .top)
            .animation(Animation.interpolatingSpring(mass: 10, stiffness: 170, damping: 5, initialVelocity: 10).repeatForever(autoreverses: true).speed(2))
            .onAppear() {
                rotateBell.toggle()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
