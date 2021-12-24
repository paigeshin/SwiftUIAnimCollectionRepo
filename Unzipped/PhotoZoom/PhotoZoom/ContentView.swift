//
//  ContentView.swift
//  PhotoZoom
//
//  Created by Amos Gyamfi on 24.2.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var unTapped = true
    
    
    // STEPS: 1. Make the 2 viws identical, 2. Attach the matchedGeometryEffect to each view
    // A name used to identify the views
    @Namespace private var zoom
    
    var body: some View {
        ZStack{
        if unTapped{
            Image("iceland")
                .resizable()
                .matchedGeometryEffect(id: "photo", in: zoom)
                .clipShape(Circle())
                .frame(width: 300, height: 300, alignment: .center)
                .blendMode(.difference)
                
        }
        
        else{
            ZStack {
                Image("iceland")
                    .resizable()
                    .matchedGeometryEffect(id: "photo", in: zoom)
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .blendMode(.difference)
                    .ignoresSafeArea()
                
                Text("ICELAND")
                    .font(.largeTitle)
                    .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
            }
                
        }
        }
        .animation(Animation.interpolatingSpring(stiffness: 50, damping: 15))
        .onTapGesture {
            unTapped.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
