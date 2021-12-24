//
//  ContentView.swift
//  LoadingIndicator
//
//  Created by Amos Gyamfi on 28.5.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var textTranparency: Double = 1 // 1
    @State private var moveDot: CGFloat = 0 // 2
    @State private var dotTransparency: Double = 0 // 3
    @State private var removeDot: CGFloat = 1 // 3
    @State private var animateWidth: CGFloat = 144
    @State private var showCheckmark = 0.0 // 5
    var body: some View {
        
        ZStack { //4. Animate buton from rectangle to a circle
            RoundedRectangle(cornerRadius: 48)
                .frame(width: animateWidth, height: 48, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .animation(Animation.timingCurve(0.99, -0.99, 0.32, 1.6).delay(2.45))
            
            Path { path in
                path.move(to: CGPoint(x: -1, y: -1))
                       path.addCurve(to: CGPoint(x: 21, y: 26), control1: CGPoint(x: -1, y: -1), control2: CGPoint(x: 22, y: 26))
                       path.addCurve(to: CGPoint(x: 56, y: -28), control1: CGPoint(x: 20, y: 26), control2: CGPoint(x: 56, y: -28))
                path.move(to: CGPoint(x: -1, y: -1))

            }// 5: Draw the check mark
            .trim(from: 0.0, to: showCheckmark)
            .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .round, lineJoin: .round))
            .foregroundColor(Color(.systemGreen))
            .scaleEffect(0.4)
            .offset(x: 65, y: 155)
            .animation(Animation.easeInOut(duration: 1).delay(3))
            
            HStack { // 2: Move the dots up and down
                Circle()
                    .frame(width: 6, height: 6, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color(#colorLiteral(red: 0.476841867, green: 0.5048075914, blue: 1, alpha: 1)))
                    .offset(y:moveDot)
                    .animation(Animation.easeOut.repeatCount(7, autoreverses: true))
                
                Circle()
                    .frame(width: 6, height: 6, alignment: .center)
                    .foregroundColor(Color(#colorLiteral(red: 0.476841867, green: 0.5048075914, blue: 1, alpha: 1)))
                    .offset(y:moveDot)
                    .animation(Animation.easeInOut.repeatCount(7, autoreverses: true))
                
                Circle()
                    .frame(width: 6, height: 6, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color(#colorLiteral(red: 0.476841867, green: 0.5048075914, blue: 1, alpha: 1)))
                    .offset(y:moveDot)
                    .animation(Animation.easeIn.repeatCount(7, autoreverses: true))
            } // 3: Hiding the dots
            .opacity(dotTransparency)
            .animation(Animation.default.delay(0.5))
            .scaleEffect(removeDot)
            .animation(Animation.default.delay(2.45))
           
            
            Text("Upload") // 1: Setting text from visible to invisible
                .foregroundColor(Color(#colorLiteral(red: 0.476841867, green: 0.5048075914, blue: 1, alpha: 1)))
                .opacity(textTranparency)
        }
        .onTapGesture {
            textTranparency = 0
            moveDot = -10
            dotTransparency = 1
            animateWidth = 48
            removeDot = 0
            showCheckmark = 1
           
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
