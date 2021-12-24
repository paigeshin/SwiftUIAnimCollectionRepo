//
//  DetailsView.swift
//  JustBreath
//
//  Created by Amos Gyamfi on 9.11.2020.
//

import Foundation
import SwiftUI

struct DetailsView: View {
    
    @State private var breatheIn = true
    @State private var breatheOut = false
    
    var body: some View{
        
        VStack{
            Text("Just Breathe")
                .font(.largeTitle)
            
            Text("Conquer the anxiety of life")
                .font(.title)
            
            Text("Live in the moment")
                .font(.title2)
            
            Text("Live in Breath")
                .font(.title3)
              
            ZStack {
                Text("Breathe Out")
                    .opacity(breatheOut ? 0 : 1) // Opacity animation
                    .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                    .onAppear {
                         breatheOut.toggle()
                }
                
                Text("Breathe In")
                    .opacity(breatheIn ? 0 : 1)
                    .scaleEffect(breatheIn ? 0 : 1, anchor: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                    .onAppear() {
                        breatheIn.toggle()
                    }
            }
            .padding(.top, 50)
           
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
