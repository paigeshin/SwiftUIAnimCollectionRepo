//
//  Comments.swift
//  Kid_on_Swing
//
//  Created by Amos Gyamfi on 13.11.2020.
//

import Foundation
import SwiftUI

struct Comments: View {
    
    // Initial animation states
    @State private var scaleIcon = 1.0
    @State private var emitIcon = 0.0
    @State private var rotateIcon = false
    @State private var changeAnchor = false
    
    @State private var comment: String = "Write a comment..."
    
    @State var heartbeat = 1.5
    @State var rotateThumb = 10
    @State private var animateSolidBorder = false
    @State private var animateDashedBorder = false
    
    var body: some View{
        VStack(alignment: .leading) {
            HStack{
                Image(systemName: "chevron.down")
                
                Text(" Comments  *  2.5k")
            }
            
            // Comment field
            HStack {
                
                Image(systemName: "arrowshape.turn.up.right.circle.fill")
                    .font(.largeTitle)
                    .foregroundColor(Color(#colorLiteral(red: 0.2, green: 0.6, blue: 1, alpha: 1)))
                
                RoundedRectangle(cornerRadius: 22)
                    .stroke()
                    .frame(width: 230, height: 37, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .overlay( // HStack as an overlay
                        HStack {
                            TextField("", text: $comment)
                            Image(systemName: "paperplane")
                                .foregroundColor(Color(#colorLiteral(red: 0.2, green: 0.6, blue: 1, alpha: 1)))
                            
                        }
                        .padding(.horizontal)
                )
                
                Spacer()
                
                ZStack { // Thumb
                    
                    Image(systemName: "hand.thumbsup.fill")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color(#colorLiteral(red: 0.2, green: 0.6, blue: 1, alpha: 1)))
                        .scaleEffect(CGFloat(scaleIcon), anchor: changeAnchor ? .bottomLeading: .bottomTrailing)
                        .offset(y: CGFloat(emitIcon))
                        .rotationEffect(.degrees(rotateIcon ? 25 : -25))
                        .animation(Animation.easeIn(duration: 4).delay(1).repeatForever(autoreverses: false))
                        .onAppear()
                        {
                            scaleIcon = 0.0
                            emitIcon = -400
                            rotateIcon.toggle()
                            changeAnchor.toggle()
                        }
                    
                    Image(systemName: "hand.thumbsup.fill")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color(#colorLiteral(red: 0.2, green: 0.6, blue: 1, alpha: 1)))
                        .scaleEffect(CGFloat(scaleIcon), anchor: changeAnchor ? .bottomLeading: .bottomTrailing)
                        .offset(y: CGFloat(emitIcon))
                        .rotationEffect(.degrees(rotateIcon ? -15 : 10))
                        .animation(Animation.easeOut(duration: 4).delay(1).repeatForever(autoreverses: false))
                        .onAppear()
                        {
                            scaleIcon = 0.0
                            emitIcon = -400
                            rotateIcon.toggle()
                            changeAnchor.toggle()
                        }
                    
                    Image("smiling")
                        .foregroundColor(Color(#colorLiteral(red: 0.2, green: 0.6, blue: 1, alpha: 1)))
                        .scaleEffect(CGFloat(scaleIcon), anchor: changeAnchor ? .bottomLeading: .bottomTrailing)
                        .offset(y: CGFloat(emitIcon))
                        .rotationEffect(.degrees(rotateIcon ? -10 : 5))
                        .animation(Animation.easeIn(duration: 4).delay(1).repeatForever(autoreverses: false))
                        .onAppear()
                        {
                            scaleIcon = 0.0
                            emitIcon = -400
                            rotateIcon.toggle()
                            changeAnchor.toggle()
                        }
                    
                    Image("smiling")
                        .foregroundColor(Color(#colorLiteral(red: 0.2, green: 0.6, blue: 1, alpha: 1)))
                        .scaleEffect(CGFloat(scaleIcon), anchor: changeAnchor ? .bottomLeading: .bottomTrailing)
                        .offset(y: CGFloat(emitIcon))
                        .rotationEffect(.degrees(rotateIcon ? -30 : 5))
                        .animation(Animation.easeOut(duration: 4).delay(1).repeatForever(autoreverses: false))
                        .onAppear()
                        {
                            scaleIcon = 0.0
                            emitIcon = -400
                            rotateIcon.toggle()
                            changeAnchor.toggle()
                        }
                    
                    // Splashes
                    Circle()  // Solid stroke
                        .strokeBorder(lineWidth: animateSolidBorder ? 0 : 25)
                        .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color(.systemRed))
                        .scaleEffect(animateSolidBorder ? 1.1 : 0)
                        .rotationEffect(.degrees(animateSolidBorder ? 150 : 0))
                        .opacity(animateSolidBorder ? 0.8 : 0)
                        .animation(Animation.easeInOut(duration: 1).delay(1.5).repeatForever(autoreverses: false))
                        .onAppear(){
                            animateSolidBorder = true
                            animateDashedBorder = true
                        }
                    
                    Circle()  //  Dashed stroke
                        .strokeBorder(style: StrokeStyle(lineWidth: animateDashedBorder ? 0 : 50, lineCap: .butt, dash: [3, 10]))
                        .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color(.systemPink))
                        .scaleEffect(animateDashedBorder ? 1.2: 0)
                        .rotationEffect(.degrees(animateSolidBorder ? 0 : -120))
                        .hueRotation(Angle(degrees: animateSolidBorder ? 0 : 45))
                        .opacity(animateDashedBorder ? 0.8 : 0)
                        .animation(Animation.easeInOut(duration: 1).delay(1.5).repeatForever(autoreverses: false))
                        .onAppear(){
                            animateSolidBorder = true
                            animateDashedBorder = true
                        }
                    
                    RoundedRectangle(cornerRadius: 18)
                        .frame(width: 36, height: 36, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color(#colorLiteral(red: 0.2, green: 0.6, blue: 1, alpha: 1)))
                        .overlay(Image(systemName: "hand.thumbsup.fill")
                                    .rotationEffect(.degrees(Double(rotateThumb)))
                                    .animation(Animation.interpolatingSpring(stiffness: 170, damping: 5).delay(0.25).repeatForever(autoreverses: false))
                                    .onAppear() {
                                        rotateThumb = -5
                                    }
                        ) // Visible thumb icon
                }
                
                
                ZStack {
                    Image(systemName: "heart.fill")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color(.systemPink))
                        .scaleEffect(CGFloat(scaleIcon), anchor: changeAnchor ? .bottomLeading: .bottomTrailing)
                        .offset(y:  CGFloat(emitIcon))
                        .rotationEffect(.degrees(rotateIcon ? -15 : -20))
                        .animation(Animation.easeOut(duration: 4).delay(1.1).repeatForever(autoreverses: false))
                        .onAppear()
                        {
                            scaleIcon = 0.0
                            emitIcon = -400
                            rotateIcon.toggle()
                            changeAnchor.toggle()
                        }
                    
                    Image(systemName: "heart.fill")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color(.systemPink))
                        .scaleEffect(CGFloat(scaleIcon), anchor: changeAnchor ? .bottomLeading: .bottomTrailing)
                        .offset(y:  CGFloat(emitIcon))
                        .rotationEffect(.degrees(rotateIcon ? 15 : -10))
                        .animation(Animation.easeInOut(duration: 4).delay(1.1).repeatForever(autoreverses: false))
                        .onAppear()
                        {
                            scaleIcon = 0.0
                            emitIcon = -400
                            rotateIcon.toggle()
                            changeAnchor.toggle()
                        }
                    
                    // Visible heart icon
                    Image(systemName: "heart.fill")
                        .font(.largeTitle)
                        .foregroundColor(Color(.systemPink))
                        .scaleEffect(CGFloat(heartbeat))
                        .animation(Animation.interpolatingSpring(stiffness: 170, damping: 5).delay(-0.5).repeatForever(autoreverses: false).speed(2))
                        .onAppear(){
                            heartbeat = 1
                        }
                }
            }
        
        }
        .padding(.horizontal)
        
        
        
    }
}

struct Comments_Previews: PreviewProvider {
    static var previews: some View {
        Comments()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
