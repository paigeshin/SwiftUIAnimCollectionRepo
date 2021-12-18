![mygif.gif](my.gif)

```swift
//
//  ContentView.swift
//  RecordPlayer
//
//  Created by paige on 2021/12/19.
//

import SwiftUI
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Could not find and play the sound file")
        }
    }
}

struct ContentView: View {

    @State private var rotateRecord = false
    @State private var rotateArm = false
    @State private var shouldAnimate = false
    @State private var degrees = 0.0

    var body: some View {
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [.white, .black]),
                center: .center, startRadius: 20, endRadius: 600)
                .scaleEffect(1.2)

            // MARK: - RECORD PLAYER BOX
            RecordPlayerBox()
                .offset(y: -80)

            // MARK: - RECORD
            VStack {
                RecordView(degrees: $degrees, shouldAnimate: $shouldAnimate)

                // MARK: - ARM
                ArmView(rotateArm: $rotateArm)

                // MARK: - BUTTON
                Button {
                    shouldAnimate.toggle()
                    if shouldAnimate {
                        degrees = 36000
                        rotateArm.toggle()
                        playSound(sound: "music", type: "m4a")
                    } else {
                        rotateArm.toggle()
                        degrees = 0
                        audioPlayer?.stop()
                    }
                } label: {
                    HStack(spacing: 8) {
                        if !shouldAnimate {
                            Text("Play")
                            Image(systemName: "play.circle.fill")
                                .imageScale(.large)
                        } else {
                            Text("Stop")
                            Image(systemName: "stop.fill")
                                .imageScale(.large)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(Capsule().strokeBorder(.black, lineWidth: 1.25))
                }


            }

        }
    }
}

struct RecordPlayerBox: View {

    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 345, height: 345)
                .cornerRadius(10)
            Image("woodGrain")
                .resizable()
                .frame(width: 325, height: 325)
                .shadow(color: .white, radius: 3, x: 0, y: 0)
        }
    }

}

struct RecordView: View {

    @Binding var degrees: Double
    @Binding var shouldAnimate: Bool

    var body: some View {
        Image("record")
            .resizable()
            .frame(width: 275, height: 275)
            .shadow(color: .gray, radius: 1, x: 0, y: 0)
            .rotationEffect(.degrees(degrees))
            .animation(.linear(duration: shouldAnimate ? 60 : 10).delay(1.5), value: shouldAnimate)
    }

}

struct ArmView: View {
    @Binding var rotateArm: Bool

    var body: some View {
        Image("playerArm")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 150, height: 150)
            .shadow(color: .gray, radius: 2, x: 0, y: 0)
            .rotationEffect(.degrees(-35), anchor: .topTrailing)
            .rotationEffect(.degrees(rotateArm ? 8 : 0), anchor: .topTrailing)
            .animation(.linear(duration: 2), value: rotateArm)
            .offset(x: 70, y: -250)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
