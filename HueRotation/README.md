![mygif.gif](my.gif)

```swift
//
//  ContentView.swift
//  HueRotation
//
//  Created by paige on 2021/12/19.
//

import SwiftUI

struct ContentView: View {

    @State private var shiftColors = false
    @State private var image = "dog"
    let backgroundColor = Color(.black)

    var body: some View {
        VStack {
            ZStack {
                backgroundColor
                    .scaleEffect(1.4)

                Image(image)
                    .resizable()
                    .padding(20)
                    .frame(width: 350, height: 350)
                    .hueRotation(.degrees(shiftColors ? 360 * 2 : 0))
                    .animation(.easeInOut(duration: 2)
                                .delay(0.4)
                                .repeatForever(autoreverses: true),
                               value: shiftColors)
                    .onAppear {
                        shiftColors.toggle()
                    }
            }
            ImagePicker(selectedImage: $image)
                .frame(width: 350, height: 200)
        }
        .background(Color.black)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct ImagePicker: View {
    @Binding var selectedImage: String
    let images = ["ornament", "landscape", "dog", "dice", "cat"]
    var body: some View {
        Picker("", selection: $selectedImage) {
            ForEach(images, id: \.self) { value in
                Text(value)
                    .foregroundColor(.white)
            }
        }
        .pickerStyle(WheelPickerStyle())
        .frame(width: 300, height: 150)
        .background(Color.red.colorMultiply(.blue))
        .cornerRadius(20)
        .shadow(color: .white, radius: 5, x: 0, y: 0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
