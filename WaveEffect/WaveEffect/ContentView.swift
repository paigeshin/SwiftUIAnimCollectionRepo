//
//  ContentView.swift
//  Waves


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
    @State private var animateOffset = false
    @State private var tiltForwardBackward = false
    @State private var upAndDown = false
    @State private var leadingAnchorAnimnate = false
    
    var body: some View {
        ZStack {
            //MARK: - BACKGROUND
            Color.blue.opacity(0.5).edgesIgnoringSafeArea(.all)
            
            //MARK: - WAVE 1
            ZStack (alignment: .top) {
                WaveCreation(animateOffset: $animateOffset, animatableOffsetTrue: 0.1, animatableOffsetFalse: -0.1, radius: 50, shawdowX: 0, shawdowY: 50, duration: 2.7, locationOffsetY: -300)
            }
            
            //MARK: - WAVE 2
            ZStack () {
                WaveCreation(animateOffset: $animateOffset, animatableOffsetTrue: -0.1, animatableOffsetFalse: 0.1, radius: 40, shawdowX: 0, shawdowY: 10, duration: 2.5, locationOffsetY: -350)
            }
            
            //MARK: - WAVE 3
            ZStack () {
                WaveCreation(animateOffset: $animateOffset, animatableOffsetTrue: 0.1, animatableOffsetFalse: -0.2, radius: 30, shawdowX: 0, shawdowY: 10, duration: 2.3, locationOffsetY: -400)
            }
            
            BuoyView(tiltForwardBackward: $tiltForwardBackward, upAndDown: $upAndDown, leadingAnchorAnimate: $leadingAnchorAnimnate)
                .offset(y: -10)
            
            //MARK: - WAVE 4
            ZStack () {
                WaveCreation(animateOffset: $animateOffset, animatableOffsetTrue: 0.2, animatableOffsetFalse: -0.1, radius: 20, shawdowX: 0, shawdowY: 10, duration: 2.7, locationOffsetY: -405)
            }
            
            //MARK: - WAVE 5
            ZStack () {
                WaveCreation(animateOffset: $animateOffset, animatableOffsetTrue: -0.2, animatableOffsetFalse: 0.2, radius: 10, shawdowX: 0, shawdowY: 10, duration: 2.2, locationOffsetY: -410)
            }
            
            //MARK: - WAVE 6
            ZStack () {
                WaveCreation(animateOffset: $animateOffset, animatableOffsetTrue: -0.1, animatableOffsetFalse: 0.2, radius: 5, shawdowX: 0, shawdowY: 5, duration: 2.8, locationOffsetY: -410)
            }
            
            //MARK: - WAVE 7
            ZStack () {
                WaveCreation(animateOffset: $animateOffset, animatableOffsetTrue: 0.1, animatableOffsetFalse: -0.1, radius: 25, shawdowX: 0, shawdowY: 40, duration: 2.1, locationOffsetY: -500)
            }
            
            //MARK: - WAVE 8
            ZStack () {
                WaveCreation(animateOffset: $animateOffset, animatableOffsetTrue: -0.2, animatableOffsetFalse: 0.1, radius: 50, shawdowX: 0, shawdowY: 50, duration: 2.9, locationOffsetY: -600)
                    .opacity(0.8)
            }
            
        }.onAppear() {
            animateOffset.toggle()
            playSound(sound: "buoyBells", type: "m4a")
        }
//        .onDisappear(){
//            audioPlayer?.stop()
//        }
    }
}

struct BuoyView: View {
    @Binding var tiltForwardBackward: Bool
    @Binding var upAndDown: Bool
    @Binding var leadingAnchorAnimate: Bool
    
    @State private var red = 1.0
    @State private var green = 1.0
    @State private var blue = 1.0
    
    var body: some View {
        ZStack {
            Image("buoy").overlay(Rectangle()
                                    .overlay(Color(red: red,green: green,blue: blue)).cornerRadius(5).frame(width: 11, height: 16).position(x: 112.5, y: 20))
                .animation(Animation.easeOut(duration: 1).repeatForever(autoreverses: true))
                .rotationEffect(.degrees(leadingAnchorAnimate ? 7 : -3), anchor: .leading)
                .animation(Animation.easeOut(duration: 0.9).repeatForever(autoreverses: true))
                .onAppear() {
                    leadingAnchorAnimate.toggle()
                }
                .rotationEffect(.degrees(tiltForwardBackward ? -20 : 15))
                .offset(y: upAndDown ? -10 : 10)
                .animation(Animation.easeInOut(duration: 1.0).delay(0.2).repeatForever(autoreverses: true))
                .onAppear() {
                    tiltForwardBackward.toggle()
                    upAndDown.toggle()
                    red = 0.5
                    green = 0.5
                    blue = 0.5
                }
        }
    }
}

struct WaveView: Shape {
    var yOffset: CGFloat = 0.1
    
    var animatableData: CGFloat {
        get {
            return yOffset
        }
        set {
            yOffset = newValue
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        //curve the bottom
        path.addCurve(to: CGPoint(x: rect.minX, y: rect.maxY),
                      control1: CGPoint(x: rect.maxX * 0.75, y: rect.maxY - (rect.maxY * yOffset)),
                       control2: CGPoint(x: rect.maxX * 0.25, y: rect.maxY + (rect.maxY * yOffset)))
        path.closeSubpath()
        return path
    }
}



struct WaveCreation: View {
    @Binding var animateOffset: Bool
    var animatableOffsetTrue: CGFloat
    var animatableOffsetFalse: CGFloat
    var radius: CGFloat
    var shawdowX: CGFloat
    var shawdowY: CGFloat
    var duration: Double
    var locationOffsetY: CGFloat

    var body: some View {
            WaveView(yOffset: animateOffset ? animatableOffsetTrue : animatableOffsetFalse)
                .fill(Color(UIColor.blue)).shadow(color: .gray, radius: radius, x: shawdowX, y: shawdowY)
                .animation(Animation.easeInOut(duration: duration).repeatForever(autoreverses: true))
                .offset(y: locationOffsetY).rotationEffect(.degrees(180))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
