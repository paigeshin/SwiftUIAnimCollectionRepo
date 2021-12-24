//
//  ClappingHandsEmojiView.swift
//  ClappingHands
//

import SwiftUI

struct ClappingHandsEmojiView: View {
    
    // Initial Animation States
    @State private var blinking = false
    @State private var openingClosing = true
    @State private var clapping = true
    
    var body: some View {
       
        VStack(alignment: .trailing) {
            ZStack {
                    if #available(iOS 15.0, *) {
                        Image("head")
                        
                        VStack {
                            ZStack {
                                Image("eyelid")
                                
                                Image("eye_blink")
                                    // 1. Eye Blink Animation
                                    .scaleEffect(y: blinking ? 0 : 1)
                                    .animation(.timingCurve(0.68, -0.6, 0.32, 1.6).delay(1).repeatForever(autoreverses: false), value: blinking)
                            }
                            
                            ZStack {
                                Image("mouth")
                                // 2. Mouth Opening Animation
                                    .scaleEffect(x: openingClosing ? 0.7 : 1)
                                    .animation(.timingCurve(0.68, -0.6, 0.32, 1.6).delay(1).repeatForever(autoreverses: true), value: openingClosing)
                                
                                HStack {
                                    Image("left_hand")
                                    // 3. Clapping Animation: Left Hand
                                        .rotationEffect(.degrees(clapping ? 15 : -5), anchor: .bottom)
                                        .offset(x: clapping ? 20 : -40)
                                        .animation(.easeInOut(duration: 0.2).repeatForever(autoreverses: true), value: clapping)
                                   
                                    Image("right_hand")
                                    // 4. Clapping Animation: Right Hand
                                        .rotationEffect(.degrees(clapping ? -15 : 5), anchor: .bottom)
                                        .offset(x: clapping ? -20 : 40)
                                        .animation(.easeInOut(duration: 0.2).repeatForever(autoreverses: true), value: clapping)
                                }
                                
                            }
                        
                        }
                        .task{
                            // Final Animation States
                            clapping.toggle()
                            blinking.toggle()
                            openingClosing.toggle()
                    }
                            
                        } else {
                            // Fallback on earlier versions
                        }
            }.frame(width: 58, height: 58)
             .scaleEffect(0.25)
            
        }
            }
    }

struct ClappingHandsEmojiView_Previews: PreviewProvider {
    static var previews: some View {
        ClappingHandsEmojiView()
            .preferredColorScheme(.dark)
    }
}
