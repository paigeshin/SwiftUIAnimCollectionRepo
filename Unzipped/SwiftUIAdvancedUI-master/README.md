- ContentView

```swift
//
//  ContentView.swift
//  RestartApp
//
//  Created by paige on 2021/12/19.
//

import SwiftUI

struct ContentView: View {

    @AppStorage("onboarding") var isOnboardingViewActive = true

    var body: some View {
        ZStack {
            if isOnboardingViewActive {
                OnboardingView()
            } else {
                HomeView()
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

- OnboardingView

```swift
//
//  OnboardingView.swift
//  RestartApp
//
//  Created by paige on 2021/12/19.
//

import SwiftUI

struct OnboardingView: View {

    @AppStorage("onboarding") var isOnboardingViewActive = true

    @State private var buttonWidth = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
    @State private var isAnimating = false

    // MARK: - PARRALEX
    @State private var imageOffset = CGSize(width: 0, height: 0) //.zero
    @State private var indicatorOpacity: Double = 1.0
    @State private var textTitle = "Share."

    let hapticFeedback = UINotificationFeedbackGenerator()

    var body: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)

            VStack(spacing: 20) {
                // MARK: - HEADER

                Spacer()

                VStack(spacing: 0) {
                    Text(textTitle)
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .transition(.opacity)
                        .id(textTitle) // We use the ID method to tell SwiftUI that a view is NO LONGER the same view => Fix Text Change UI Bug(Strange Behavior)

                    Text("""
                         It's not how much we give but
                         how much love we put into giving
                         """)
                        .font(.title)
                        .fontWeight(.light)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 10)

                } //: HEADER
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : -40)
                .animation(.easeOut(duration: 1), value: isAnimating)

                // MARK: - CENTER
                ZStack {
                    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
                        .offset(x: imageOffset.width * -1)
                        .blur(radius: abs(imageOffset.width / 5))
                        .animation(.easeOut(duration: 1), value: imageOffset)

                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 0.5), value: isAnimating)
                        .offset(x: imageOffset.width * 1.2, y: 0)
                        .rotationEffect(.degrees(Double(imageOffset.width / 20)))
                        .gesture(
                            DragGesture()
                                .onChanged({ gesture in
                                    if abs(imageOffset.width) <= 150 {
                                        imageOffset = gesture.translation

                                        withAnimation {
                                            indicatorOpacity = 0
                                            textTitle = "Give."
                                        }

                                    }
                                })
                                .onEnded({ _ in
                                    imageOffset = .zero
                                    withAnimation(.linear(duration: 0.25)) {
                                        indicatorOpacity = 1
                                        textTitle = "Share."
                                    }
                                })
                        ) //: GESTURE
                        .animation(.easeOut(duration: 1), value: imageOffset)

                } //: Center
                .overlay(
                    Image(systemName: "arrow.left.and.right.circle")
                        .font(.system(size: 42, weight: .ultraLight))
                        .foregroundColor(.white)
                        .offset(y: 20)
                        .opacity(isAnimating ? 1: 0)
                        .animation(.easeOut(duration: 1).delay(2), value: isAnimating)
                        .opacity(indicatorOpacity)
                    , alignment: .bottom
                )

                Spacer()

                // MARK: - FOOTER
                ZStack {
                    // PARTS OF THE CUSTOM BUTTOM

                    // 1. Background (static)
                    Capsule()
                        .fill(.white.opacity(0.2))

                    Capsule()
                        .fill(.white.opacity(0.2))
                        .padding(8)

                    // 2. Call-to-action (static)
                    Text("Get Started")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x: 20)

                    // 3. Capsule (Dynamic width)
                    HStack {
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: buttonOffset + 80)
                        Spacer()
                    }

                    // 4. Circle (Draggable)
                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color("ColorRed"))
                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                        }
                        .foregroundColor(.white)
                        .frame(width: 80, height: 80, alignment: .center)
                        .offset(x: buttonOffset)
                        .gesture(
                            DragGesture()
                                .onChanged({ gesture in
                                    // left to right
                                    if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80 {
                                        buttonOffset = gesture.translation.width
                                    }
                                })
                                .onEnded({ _ in
                                    withAnimation(.easeOut(duration: 0.4)) {
                                        if buttonOffset > buttonWidth / 2 {
                                            hapticFeedback.notificationOccurred(.success)
                                            playSound(sound: "chimeup", type: "mp3")
                                            buttonOffset = buttonWidth - 80
                                            isOnboardingViewActive = false
                                        } else {
                                            hapticFeedback.notificationOccurred(.warning)
                                            buttonOffset = 0
                                        }
                                    }
                                })
                        ) //: GESTURE

                        Spacer()
                    } //: HSTACK



                } //: FOOTER
                .frame(width: buttonWidth, height: 80, alignment: .center)
                .padding()
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : 40)
                .animation(.easeOut(duration: 1), value: isAnimating)

            } //: VSTACK
        } //: ZSTACK
        .onAppear {
            isAnimating = true
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
```

- HomeView

```swift
//
//  HomeView.swift
//  RestartApp
//
//  Created by paige on 2021/12/19.
//

import SwiftUI

struct HomeView: View {

    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    @State private var isAnimating = false

    var body: some View {
        VStack(spacing: 20) {

            // MARK: - HEADER

            Spacer()

            ZStack {
                CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)

                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 35 : -35)
                    .animation(
                        .easeInOut(duration: 4)
                        .repeatForever(),
                        value: isAnimating
                    )
            }

            // MARK: - CENTER
            Text("Time time that leads to mastery is dependent on the intensity of our focus.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()

            // MARK: - FOOTER

            Spacer()

            Button {
                withAnimation {
                    playSound(sound: "success", type: "m4a")
                    isOnboardingViewActive = true
                }
            } label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
            } //: BUTTON
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        } //: VSTACK
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isAnimating = true
            }
        }
        .preferredColorScheme(.dark)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
```

- CircleGroupView

```swift
//
//  CircleGroupView.swift
//  RestartApp
//
//  Created by paige on 2021/12/19.
//

import SwiftUI

struct CircleGroupView: View {

    @State var ShapeColor: Color
    @State var ShapeOpacity: Double
    @State private var isAnimating = false

    var body: some View {
        ZStack {
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        } //: ZSTACK
        .blur(radius: isAnimating ? 0 : 10)
        .opacity(isAnimating ? 1 : 0)
        .scaleEffect(isAnimating ? 1 : 0.5)
        .animation(.easeOut(duration: 1), value: isAnimating)
        .onAppear {
            isAnimating = true
        }
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)

            CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
        }

    }
}
```

- AudioPlayer

```swift
//
//  AudioPlayer.swift
//  RestartApp
//
//  Created by paige on 2021/12/19.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Could not play the sound file.")
        }
    }
}
```
