//
//  ContentView.swift
//  SlideToPowerOff
//
//  Created by Amos Gyamfi on 6.7.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var shimmer = false
    
    let phoneScreen = Image("bg1")
    
    var body: some View {
       
            ZStack {
                
                phoneScreen
                    .blur(radius: 10)
                    .ignoresSafeArea(.all)
                    
                VStack {
                    ZStack {
                        if #available(iOS 15.0, *) {
                            RoundedRectangle(cornerRadius: 32)
                                .foregroundColor(Color(.systemGray))
                                .foregroundStyle(.ultraThickMaterial)
                                .blendMode(.plusLighter)
                                
                        } else {
                            // Fallback on earlier versions
                        }
                        
                        HStack {
                            Image(systemName: "power.circle.fill")
                                .font(.system(size: 54))
                            if #available(iOS 15.0, *) {
                                Text("**Slide to power off**                          ")
                                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color.black, Color.white]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: shimmer ? .trailing : .leading))
                                    .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: false))
                                    .task {
                                        shimmer.toggle()
                                    }
                                    
                                
                            } else {
                                // Fallback on earlier versions
                            }
                            
                            Spacer()
                        }
                            
                    }
                    .frame( maxWidth: 250, maxHeight: 64)
                    
                    VStack {
                        Spacer()
                        
                        if #available(iOS 15.0, *) {
                            Image(systemName: "power.circle.fill")
                                .font(.system(size: 54))
                                .foregroundColor(Color(.systemGray))
                                .foregroundStyle(.ultraThinMaterial)
                                .blendMode(.screen)
                        } else {
                            // Fallback on earlier versions
                        }
                        Text("Cancel")
                    }
                    
                    Spacer()
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
