//
//  ContentView.swift
//  BgColorKeyframeAnimkation
//
//  Created by Amos Gyamfi on 30.8.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var switchColor = Color(.red)
    
    var body: some View {
        if #available(iOS 15.0, *) {
            ZStack {
                Rectangle()
                    .ignoresSafeArea()
                    .foregroundColor(switchColor)
                    .task {
                        // 2nd keyframe
                        withAnimation(Animation.easeInOut(duration: 1).delay(2)){
                           switchColor = Color(.yellow)
                        }
                        
                        // 3rd keyframe
                        withAnimation(Animation.easeInOut(duration: 1).delay(4)){
                           switchColor = Color(.blue)
                        }
                        
                        // 4th keyframe
                        withAnimation(Animation.easeInOut(duration: 1).delay(6)){
                           switchColor = Color(.orange)
                        }
                        
                        // 5th keyframe
                        withAnimation(Animation.easeInOut(duration: 1).delay(8)){
                           switchColor = Color(.green)
                        }
                        
                        // final keyframe
                        withAnimation(Animation.easeInOut(duration: 1).delay(10)){
                           switchColor = Color(.purple)
                        }
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
