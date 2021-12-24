//
//  MovingComments.swift
//  Kid_on_Swing
//
//  Created by Amos Gyamfi on 14.11.2020.
//

import Foundation
import SwiftUI

struct MovingComments: View {
    var body: some View{
        
        VStack(spacing: 30) {
            HStack(alignment: .top) {
                
                Image("amos_30x30")
                
                Color(#colorLiteral(red: 0.862745098, green: 0.9294117647, blue: 1, alpha: 1))  // Color as a view
                    .frame(width: 193, height: 50)
                    .cornerRadius(26)
                    // Custom message bubble
                    .overlay(
                        Rectangle()
                            .frame(width: 25, height: 25)
                            .foregroundColor( Color(#colorLiteral(red: 0.862745098, green: 0.9294117647, blue: 1, alpha: 1)) )
                            .offset(x: 84, y: -12.5))
                    .overlay(VStack(alignment: .leading) {
                        Text("Amos Gyamfi")
                            .fontWeight(.bold)
                        Text("OMG!!!, a true relaxation!")
                }
                .font(.caption)
                .foregroundColor(Color(#colorLiteral(red: 0.4666666667, green: 0.4666666667, blue: 0.4666666667, alpha: 1))))
            }
            
            HStack(alignment: .top) {
                
                Image("logo")
                    .resizable()
                    .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                Color(#colorLiteral(red: 0.862745098, green: 0.9294117647, blue: 1, alpha: 1))  // Color as a view
                    .frame(width: 193, height: 50)
                    .cornerRadius(26)
                    // Custom message bubble
                    .overlay(
                        Rectangle()
                            .frame(width: 25, height: 25)
                            .foregroundColor( Color(#colorLiteral(red: 0.862745098, green: 0.9294117647, blue: 1, alpha: 1)) )
                            .offset(x: 84, y: -12.5))
                    .overlay(VStack(alignment: .leading) {
                        Text("Gyamfi")
                            .fontWeight(.bold)
                        Text("OH!, Where is that?. Nice")
                }
                .font(.caption)
                .foregroundColor(Color(#colorLiteral(red: 0.4666666667, green: 0.4666666667, blue: 0.4666666667, alpha: 1))))
            }
            
            HStack(alignment: .top) {
                
                Image("andras_profile")
                    .resizable()
                    .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                Color(#colorLiteral(red: 0.862745098, green: 0.9294117647, blue: 1, alpha: 1))  // Color as a view
                    .frame(width: 193, height: 50)
                    .cornerRadius(26)
                    // Custom message bubble
                    .overlay(
                        Rectangle()
                            .frame(width: 25, height: 25)
                            .foregroundColor( Color(#colorLiteral(red: 0.862745098, green: 0.9294117647, blue: 1, alpha: 1)) )
                            .offset(x: 84, y: -12.5))
                    .overlay(VStack(alignment: .leading) {
                        Text("Harrison G.")
                            .fontWeight(.bold)
                        Text("OMG!!!, a true relaxation!")
                }
                .font(.caption)
                .foregroundColor(Color(#colorLiteral(red: 0.4666666667, green: 0.4666666667, blue: 0.4666666667, alpha: 1))))
            }
            
            HStack(alignment: .top) {
                
                Image(systemName: "b.circle.fill")
                    .font(.system(size: 30))
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 0.3803921569, blue: 0.3803921569, alpha: 1)))
                
                Color(#colorLiteral(red: 0.862745098, green: 0.9294117647, blue: 1, alpha: 1))  // Color as a view
                    .frame(width: 193, height: 50)
                    .cornerRadius(26)
                    // Custom message bubble
                    .overlay(
                        Rectangle()
                            .frame(width: 25, height: 25)
                            .foregroundColor( Color(#colorLiteral(red: 0.862745098, green: 0.9294117647, blue: 1, alpha: 1)) )
                            .offset(x: 84, y: -12.5))
                    .overlay(VStack(alignment: .leading) {
                        Text("Bella")
                            .fontWeight(.bold)
                        Text("I wish I am there with You")
                }
                .font(.caption)
                .foregroundColor(Color(#colorLiteral(red: 0.4666666667, green: 0.4666666667, blue: 0.4666666667, alpha: 1))))
            }
            
            HStack(alignment: .top) {
                
                Image(systemName: "c.circle.fill")
                    .font(.system(size: 30))
                    .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 1, alpha: 1)))
                
                Color(#colorLiteral(red: 0.862745098, green: 0.9294117647, blue: 1, alpha: 1))  // Color as a view
                    .frame(width: 193, height: 50)
                    .cornerRadius(26)
                    // Custom message bubble
                    .overlay(
                        Rectangle()
                            .frame(width: 25, height: 25)
                            .foregroundColor( Color(#colorLiteral(red: 0.862745098, green: 0.9294117647, blue: 1, alpha: 1)) )
                            .offset(x: 84, y: -12.5))
                    .overlay(VStack(alignment: .leading) {
                        Text("Collins")
                            .fontWeight(.bold)
                        Text("Take me there next time!!")
                }
                .font(.caption)
                .foregroundColor(Color(#colorLiteral(red: 0.4666666667, green: 0.4666666667, blue: 0.4666666667, alpha: 1))))
            }
        } // Container for all views
    }
}

struct MovingComments_Previews: PreviewProvider {
    static var previews: some View {
        MovingComments()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
