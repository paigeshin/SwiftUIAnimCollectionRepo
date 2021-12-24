//
//  ContentView.swift
//  SlideToAnswer
//
//  Created by Amos Gyamfi on 14.7.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var slideToAnswer = false
    
    let phoneScreen = Image("bg")
    
    var body: some View {
        ZStack {
            
            phoneScreen
                .ignoresSafeArea(.all)
            
            VStack {
                
                ZStack {
                    if #available(iOS 15.0, *) {
                        RoundedRectangle(cornerRadius: 32)
                            .foregroundColor(Color(.systemGray))
                            .foregroundStyle(.ultraThickMaterial)
                            .blendMode(.lighten)
                            
                    } else {
                        // Fallback on earlier versions
                    }
                    
                    HStack {
                        Image(systemName: "chevron.forward.circle.fill")
                            .font(.system(size: 54))
                        if #available(iOS 15.0, *) {
                            Text("**Slide to answer**                          ")
                                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color.black, Color.white]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint:  slideToAnswer ? .trailing : .leading))
                                .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: false))
                                .task {
                                    slideToAnswer.toggle()
                                }
                        } else {
                            // Fallback on earlier versions
                        }
                        
                        Spacer()
                    }
                        
                }
                .frame( maxWidth: 250, maxHeight: 64)
                
                
                
               
            }  // All views
            .frame( maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
            .padding(.top, 150)
            .padding(.bottom, 120)
        }
}
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
