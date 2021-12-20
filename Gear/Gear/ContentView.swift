//
//  ContentView.swift
//  Gears and Belts


import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            //MARK: - MOTOR AND GEAR 1 AND 2 - Z AXIS ROTATION
            ZStack {
                Image("motor").resizable().aspectRatio(contentMode: .fit).frame(width: 140, height: 120)
                    .offset(x: -120, y: 90)
                //motor gear 1
                GearView(gearImage: "doubleGear", gearWidth: 40, gearDegrees: 360, offsetGearX: -124, offsetGearY: 102, duration: 5)
                //top left gear
                GearView(gearImage: "doubleGear", gearWidth: 100, gearDegrees: 360, offsetGearX: -124, offsetGearY: -280, duration: 7)
            }
            //MARK: - TOP BELT AND GEAR 3 - X AXIS ROTATION
            ZStack {
                //top belt
                BeltView(animateBelt: true, beltWidth: 352, beltHeight: 100, offsetBeltX: 0, offsetBeltY: -280, dashPhaseValue: -360, rotateDegrees: 0)
                //top right gear - double gear
                GearView(gearImage: "doubleGear", gearWidth: 100, gearDegrees: 360, offsetGearX: 124, offsetGearY: -280, duration: 7)
            }
            
            //MARK: - GEARS 4, 5, 6 - Z AXIS ROTATION
            ZStack {
                //middle right gear - gear 4
                GearView(gearImage: "doubleGear", gearWidth: 100, gearDegrees: 360, offsetGearX: 124, offsetGearY: -70, duration: 5)
                //middle second gear from the right - gear 5
                GearView(gearImage: "doubleGear", gearWidth: 80, gearDegrees: -360, offsetGearX: 49, offsetGearY: -113, duration: 5)
                //middle third gear from the right - gear 6
                GearView(gearImage: "doubleGear", gearWidth: 100, gearDegrees: 360, offsetGearX: -6, offsetGearY: -80, duration: 6)
            }
            //MARK: - BELT - Z AXIS ROTATION
            ZStack {
                //belt 1 for the motor - long belt left side
                BeltView(animateBelt: true, beltWidth: 425, beltHeight: 48, offsetBeltX: -124, offsetBeltY: -90, rotateDegrees: 90)
                //belt 2 - short belt right side
                BeltView(animateBelt: true, beltWidth: 258, beltHeight: 48, offsetBeltX: 124, offsetBeltY: -175, rotateDegrees: 90)
            }
            //MARK: - GEAR 7 AND BELT 3 - X AXIS ROTATION
            ZStack {
            //middle fourth from the right gear 7
            GearView(gearImage: "singleGear", gearWidth: 100, gearDegrees: -360, offsetGearX: -62, offsetGearY: -85, rotateDegrees: 79, duration: 7, xAxis: 0, yAxis: 1, zAxis: 0)
            //middle small belt
            BeltView(animateBelt: true, beltWidth: 22, beltHeight: 120, dashPhaseValue: -40)
                .rotation3DEffect(.degrees(70), axis: (x: 0, y: 1, z: 0))
                .offset(x: -60, y: -33)
            //bottom right gear
            GearView(gearImage: "singleGear", gearWidth: 100, gearDegrees: -360, offsetGearX: 160, offsetGearY: 94, rotateDegrees: 79, duration: 7, xAxis: 0, yAxis: 1, zAxis: 0)
            //bottom right small belt
            BeltView(animateBelt: true, beltWidth: 22, beltHeight: 170, offsetBeltX: 0, offsetBeltY: -10, dashPhaseValue: -40, rotateDegrees: 0)
                .rotation3DEffect(.degrees(70), axis: (x: 0, y: 1, z: 0))
                .offset(x: 162, y: 185)
            //bottom shaft
            ShaftView(width: 170).offset(x: 95, y: 260)
            }
            
            //MARK: - WORM GEAR AND Y AXIS ROTATION AND SHAFT VIEW
            ZStack {
                //worm gear
                WormGearsView().offset(x: 60, y: 30)
                //middle y axis gear
                GearView(gearImage: "singleGear", gearWidth: 175, gearDegrees: 360, offsetGearX: 60, offsetGearY: 39, rotateDegrees: 84, duration: 7, xAxis: 1, yAxis: 0, zAxis: 0)
                //shaftView connecting to the worm and belt
                ShaftView(width: 120).offset(x: -13, y: 30)
            }
            
            //MARK: - FAN
            FanView().offset(x: 0, y: 250).frame(width: 140, height: 140)
        }
        .background(Image("goldBackground").resizable().aspectRatio(contentMode: .fill)
                        .frame(width: 400, height: 1000))
    }
}

struct BeltView: View {
    @State var animateBelt: Bool = false
    //bet vars
    var beltWidth: CGFloat = 0.0
    var beltHeight: CGFloat = 0.0
    var offsetBeltX: CGFloat = 0.0
    var offsetBeltY: CGFloat = 0.0
    var dashPhaseValue: CGFloat = 40
    //rotate belt
    var rotateDegrees: Double = 0.0
    
    var xAxis: CGFloat = 0.0
    var yAxis: CGFloat = 0.0
    var zAxis: CGFloat = 0.0
    
    var body: some View {
        ZStack {
            //belt
            Capsule()
                .trim(from: 0, to: 1)
                .stroke(Color.black, style: StrokeStyle(lineWidth: 7, lineJoin: .round, dash: [5, 1.5], dashPhase: animateBelt ? dashPhaseValue : 0))
                .frame(width: beltWidth, height: beltHeight)
                .animation(Animation.linear(duration: 3).repeatForever(autoreverses: false).speed(3))
                .onAppear {
                    animateBelt.toggle()
                }
        }
        .shadow(color: .black, radius: 1, x: 1, y: 0)
        .rotationEffect(.degrees(rotateDegrees), anchor: .center)
        .offset(x: offsetBeltX, y: offsetBeltY)
    }
}

struct FanView: View {
    var degrees: Double = 360 * 4
    @State private var rotateFan = false
    
    var body: some View {
        ZStack {
        Image("fan").resizable().aspectRatio(contentMode: .fit).frame(width: 200)
            .rotationEffect(.degrees(rotateFan ? degrees : 0), anchor: .center)
            .animation(Animation.linear(duration: 4).repeatForever(autoreverses: false))
        }.onAppear() {
            rotateFan.toggle()
        }.shadow(color: .black, radius: 1)
    }
}

struct GearView: View {
    
    //animation var
    @State private var rotateGear = false
    //gear vars
    var gearImage: String = ""
    var gearWidth: CGFloat = 0.0
    var gearDegrees: Double = 0.0
    var offsetGearX: CGFloat = 0.0
    var offsetGearY: CGFloat = 0.0
    var rotateDegrees: Double = 0.0
    var duration: Double = 0.0
    var xAxis: CGFloat = 0.0
    var yAxis: CGFloat = 0.0
    var zAxis: CGFloat = 0.0
    
    
    var body: some View {
        ZStack {
            Image(gearImage).resizable().aspectRatio(contentMode: .fit)
                .frame(width: gearWidth)
                .rotationEffect(.degrees(rotateGear ? gearDegrees : 0))
                .animation(Animation.linear(duration: duration).repeatForever(autoreverses: false))
                .rotation3DEffect(
                    .degrees(rotateDegrees),axis: (x: xAxis, y: yAxis, z: zAxis))
                .offset(x: offsetGearX, y: offsetGearY)
        }.onAppear() {
            rotateGear.toggle()
        }.shadow(color: .black, radius: 1, x: 0, y: 0)
    }
}

struct ShaftView: View {
    var width: CGFloat = 0.0
    var motionOffsetX: CGFloat = 0.0
    var motionOffsetY: CGFloat = 0.0
    @State var animateRect: Bool = false
    
    var body: some View {
        
        ZStack {
            Image("shaft").resizable()
                .frame(width: width, height: 40)
            ShaftMotionView(motionWidth: width - 30, motonOffsetY: -7)
        }
    }
}

struct ShaftMotionView: View {
    var motionWidth: CGFloat = 0.0
    var motionOffsetX: CGFloat = 0.0
    var motonOffsetY: CGFloat = 0.0
    @State private var animateRect: Bool = false
    
    var body: some View {
        ZStack {
            Rectangle().frame(width: motionWidth, height: 8)
                .foregroundColor(.black)
                .cornerRadius(5)
                .opacity(animateRect ? 0 : 0.3)
                .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true))
                .onAppear() {
                    animateRect.toggle()
                }
        }.offset(x: motionOffsetX, y: motonOffsetY)
    }
}

struct WormGearsView: View {
    
    @State private var rotateWormGear = false
    @State private var animateRect1 = false
    @State private var animateRect2 = false
    @State private var animateRect3 = false
    @State private var animateRect4 = false
    
    var body: some View {
        ZStack {
            ZStack {
                //MARK: - WORM GEAR
                Image("wormGear").resizable().frame(width: 100, height: 75)
                
                //MARK: - RECTANGLES FOT THE TURNING EFFECT
                HStack {
                    Rectangle().frame(width: 4, height: 40).foregroundColor(.black)
                        .cornerRadius(5).opacity(animateRect1 ? 0 : 0.3)
                        .offset(x: 2, y: animateRect1 ? 14 : -8)
                        .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true))
                        .rotationEffect(.degrees(-4), anchor: .top)
                        .onAppear(){
                            animateRect1.toggle()
                        }
                    
                    Rectangle().frame(width: 4, height: 40).foregroundColor(.black)
                        .cornerRadius(5).opacity(animateRect2 ? 0 : 0.3)
                        .offset(x: 7, y: animateRect2 ? -15 : -8)
                        .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true))
                        .rotationEffect(.degrees(-8))
                        .onAppear(){
                            animateRect2.toggle()
                        }
                    
                    Rectangle().frame(width: 4, height: 40).foregroundColor(.black)
                        .cornerRadius(5).opacity(animateRect3 ? 0 : 0.3)
                        .offset(x: 7, y: animateRect3 ? -5 : -10)
                        .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true))
                        .rotationEffect(.degrees(-8), anchor: .top)
                        .onAppear(){
                            animateRect3.toggle()
                        }
                    
                    Rectangle().frame(width: 4, height: 40).foregroundColor(.black)
                        .cornerRadius(5).opacity(animateRect4 ? 0 : 0.3)
                        .offset(x: 5, y: animateRect4 ? -10 : -10)
                        .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true))
                        .rotationEffect(.degrees(-8), anchor: .top)
                        .onAppear(){
                            animateRect4.toggle()
                        }
                }
            }
        }.shadow(color: .black, radius: 0.4, x: 0, y: 1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
