//
//  Birds.swift
//  Kayak
//
//  Created by Amos Gyamfi on 23.8.2020.
//

import Foundation
import SwiftUI


struct Birds: View {
    
    @State var swingLwing = 0
    @State var swingRwing = 0
    @State var moveBird = -400
    
    var body: some View {
        
        
        // Birds
        ZStack {
            ZStack {
                Image("l_wing") // Left wing
                    .rotationEffect(.degrees(Double(swingLwing)), anchor: .trailing)
                    .animation(Animation.easeInOut(duration: 0.25).repeatForever(autoreverses: true))
                
                Image("r_wing") // Right wing
                    .rotationEffect(.degrees(Double(swingRwing)), anchor: .leading)
                    .animation(Animation.easeInOut(duration: 0.25).repeatForever(autoreverses: true))
                    .offset(x: 9, y: 4)
            }
            .scaleEffect(4)
            .animation(Animation.easeInOut(duration: 0.25).repeatForever(autoreverses: true))
            .offset(y: CGFloat(moveBird))
            
            
            // Small bird
            ZStack {
                Image("l_wing")
                    .rotationEffect(.degrees(Double(swingLwing)), anchor: .trailing)
                    .animation(Animation.easeOut(duration: 0.25).repeatForever(autoreverses: true))
                
                Image("r_wing")
                    .rotationEffect(.degrees(Double(swingRwing)), anchor: .leading)
                    .animation(Animation.easeOut(duration: 0.25).repeatForever(autoreverses: true))
                    .offset(x: 9, y: 4)
            }
            .scaleEffect(2)
            .animation(Animation.easeInOut(duration: 0.25).repeatForever(autoreverses: true))
            .offset(x: 100, y: CGFloat(moveBird))
        }
        .onAppear() {
            swingLwing = 45
            swingRwing = -45
            moveBird = -405
        }
        
        
    }
    }
    

struct Birds_Previews: PreviewProvider {
    static var previews: some View {
        Birds()
    }
}
