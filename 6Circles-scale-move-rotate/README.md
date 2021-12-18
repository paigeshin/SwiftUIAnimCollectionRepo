![mygif.gif](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/6001a9e7-a637-4b8f-bb76-b5a12b639aa3/mygif.gif)

```swift
//
//  ContentView.swift
//  AnimCollectionRepo
//
//  Created by paige on 2021/12/19.
//

import SwiftUI

struct ContentView: View {

    @State private var scaleInOut = false
    @State private var rotateInOut = false
    @State private var moveInOut = false

    var body: some View {
        ZStack {
            Rectangle()
                .edgesIgnoringSafeArea(.all)

            ZStack {

                // MARK: - CRICLES SET 1
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(gradient: Gradient(colors: [.green, .white]), startPoint: .top, endPoint: .bottom)
                        )
                        .frame(width: 120, height: 120)
                        .offset(y: moveInOut ? -60 : 0)

                    Circle()
                        .fill(
                            LinearGradient(gradient: Gradient(colors: [.green, .white]), startPoint: .bottom, endPoint: .top)
                        )
                        .frame(width: 120, height: 120)
                        .offset(y: moveInOut ? 60 : 0)
                } //: ZSTACK
                .opacity(0.5)

                // MARK: - CRICLES SET 2
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(gradient: Gradient(colors: [.green, .white]), startPoint: .top, endPoint: .bottom)
                        )
                        .frame(width: 120, height: 120)
                        .offset(y: moveInOut ? -60 : 0)

                    Circle()
                        .fill(
                            LinearGradient(gradient: Gradient(colors: [.green, .white]), startPoint: .bottom, endPoint: .top)
                        )
                        .frame(width: 120, height: 120)
                        .offset(y: moveInOut ? 60 : 0)
                } //: ZSTACK
                .opacity(0.5)
                .rotationEffect(.degrees(60))

                // MARK: - CRICLES SET 3
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(gradient: Gradient(colors: [.green, .white]), startPoint: .top, endPoint: .bottom)
                        )
                        .frame(width: 120, height: 120)
                        .offset(y: moveInOut ? -60 : 0)

                    Circle()
                        .fill(
                            LinearGradient(gradient: Gradient(colors: [.green, .white]), startPoint: .bottom, endPoint: .top)
                        )
                        .frame(width: 120, height: 120)
                        .offset(y: moveInOut ? 60 : 0)
                } //: ZSTACK
                .opacity(0.5)
                .rotationEffect(.degrees(120))

            } //: ZSTACK
            .rotationEffect(.degrees(rotateInOut ? 90 : 0))
            .scaleEffect(scaleInOut ? 1 : 1/4)
            .animation(Animation.easeInOut.repeatForever(autoreverses: true).speed(1/8), value: moveInOut)
            .onAppear {
                moveInOut.toggle()
                scaleInOut.toggle()
                rotateInOut.toggle()
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
