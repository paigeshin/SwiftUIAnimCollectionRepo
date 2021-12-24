//
//  Message.swift
//  Kayak
//
//  Created by Amos Gyamfi on 24.8.2020.
//

import Foundation
import SwiftUI

struct Message: View {
    var body: some View {
        VStack {
            Image("KayakLogo")
            Text("Enjoy the calmness of the river")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Text("How far can you go?")
                .font(.headline)
            Text("It is fun with friends!")
                .font(.subheadline)
            
            Spacer()
        }.padding()
    }
}

struct Message_Previews: PreviewProvider {
    static var previews: some View {
        Message()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
