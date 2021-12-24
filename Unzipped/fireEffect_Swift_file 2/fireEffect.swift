// 1. import SwiftUI and Playground support
import  SwiftUI
import PlaygroundSupport

// 2. Create a custom view
struct notifications: View {
    // 1. Initial animation state
    @State private var showHideMask = 0
    
    var body: some View{
        Text("hotjar")
            .font(.system(size: 144))
            // Place flame icon infront of the text
            .overlay(Image(systemName: "flame.fill").font(.largeTitle)
                        // Put a rectangular mask on the flame icon
                        .clipShape(Rectangle()
                                    // 2. Mask offset
                                    .offset(y: CGFloat(showHideMask)))
                        // Flame icon offset
                        .offset(x: 40, y: -50).foregroundColor(.red)
                        // 3. Animate the mask offset
                        .animation(Animation.easeInOut(duration: 0.5)
                                    .repeatForever(autoreverses: true)
                                    .speed(6))
                        .onAppear(){
                            // 4. Final animation state
                            showHideMask = 35
            })
    }
}

// 3. Create Playground page and add live preview
PlaygroundPage.current.setLiveView(notifications())

