//
//  ContentView.swift
//  SetGoals WatchKit Extension
//
//  Created by Amos Gyamfi on 19.2.2021.
//

import SwiftUI

struct ContentView: View {
    
    // 1. Add a state variable
    @State private var increase: Int = 8
    
    var body: some View {
        VStack {
            
            Spacer()
            Spacer()
            
            HStack {
                Text("Cancel")
                    .padding()
                
                Spacer()
            }
            
            Text("Stand Goal")
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            
            // Minus button
            HStack(alignment: .top) {
                Image(systemName: "minus.circle.fill")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .onTapGesture {
                        increase -= 1
                    }
                    
                
                VStack {
                    Text("\(increase)")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                       
                    
                    Text("Hours")
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                }
                 
                // Plus button
                Image(systemName: "plus.circle.fill")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .onTapGesture {
                        increase += 1
                    }
                    
            }
            .padding()
            
            Spacer()
           
            RoundedRectangle(cornerRadius: 21)
                .frame(width: 150, height: 42, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .overlay(Text("Ok"))
        } // All views
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
