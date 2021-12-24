//
//  ContentView.swift
//  CopyingFilesAnimation
//
//  Created by Amos Gyamfi on 24.7.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var moveFiles = -2.5
    @State private var reduceFilesLevel = 1.0
    @State private var increaseFilesLevel = 0
    
    var body: some View {
        if #available(iOS 15.0, *) {
            VStack {
                
                Text("Copying files, wait...")
                
                HStack(spacing: 50) {
                    ZStack {
                        Circle()
                            .stroke()
                            .frame(width: 250, height: 250)
                            .hidden()
                        
                        Image(systemName: "paperplane.fill") // File 1
                            .offset(x: -130)
                            .rotationEffect(.degrees(Double(moveFiles)))
                            .animation(
                                Animation
                                    .easeOut(duration: 1)
                                    .delay(1)
                                    .repeatForever(autoreverses: false)
                                    .speed(0.5)) // Animation
                        
                        Image(systemName: "paperplane.fill") // File 2
                            .offset(x: -130)
                            .rotationEffect(.degrees(Double(moveFiles)))
                            .animation(Animation
                                    .easeInOut(duration: 1)
                                    .delay(1)
                                    .repeatForever(autoreverses: false)
                                    .speed(0.5)) // Animation
                        
                        Image(systemName: "paperplane.fill") // File 3
                            .offset(x: -130)
                            .rotationEffect(.degrees(Double(moveFiles)))
                            .animation(
                                Animation
                                    .easeIn(duration: 1)
                                    .delay(1)
                                    .repeatForever(autoreverses: false)
                                    .speed(0.5)) // Animation
                        
                        Image(systemName: "folder") // Left folder
                            .font(.largeTitle)
                            .overlay(
                                Rectangle()
                                    .clipShape(Rectangle().offset(y: 0))
                                    .frame(width: 36, height: 17, alignment: .bottom)
                                    .scaleEffect(x: 1, y: CGFloat(reduceFilesLevel), anchor: .bottom)
                                    .offset(y: 5)
                                    .animation(
                                        Animation
                                            .easeOut(duration: 10)
                                            .delay(1)
                                            .repeatForever(autoreverses: false)
                                            .speed(0.5)) // Animation
                            )
                            .offset(x: -125)
                        // Left folder ends here
                        
                        
                        
                    } // Folder and paperplane
                    
                    Image(systemName: "folder") // Right folder
                        .font(.largeTitle)
                        .overlay(
                            Rectangle()
                                .clipShape(Rectangle().offset(y: 0))
                                .frame(width: 36, height: 17, alignment: .bottom)
                                .scaleEffect(x: 1, y: CGFloat(increaseFilesLevel), anchor: .bottom)
                                .offset(y: 5)
                                .animation(
                                    Animation
                                        .easeInOut(duration: 10)
                                        .delay(1)
                                        .repeatForever(autoreverses: false)
                                        .speed(0.5)) // Animation
                        )
                        .offset(x: -75)// Right folder ends here
                    
                }
                .padding(.horizontal)
                .offset(x: 50)
                .task {
                    moveFiles = 180
                    reduceFilesLevel = 0.5
                    increaseFilesLevel = 1
            }
            }
            
        } else {
            // Fallback on earlier versions
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
