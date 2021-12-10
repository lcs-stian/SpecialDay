//
//  ContentView.swift
//  SpecialDay
//
//  Created by Suzanne Tian on 2021-12-10.
//

import SwiftUI

struct ContentView: View {
    
    @State var monthGuess: Double = 6.0
    let target = 2
    
    @State var feedback = ""
    
    var body: some View {
        VStack{
            
            Text("Month")
            
            Slider(value: $monthGuess,
                   in: 1.0...12.0,
                   step: 1.0,
                   label: {
                Text("Guess")
            },
                   minimumValueLabel: {
                Text("1.0")
            },
                   maximumValueLabel: {
                Text("12.0")
            })
                .padding()
            
            Text ("\(String(format: "%.f", monthGuess))")
             
            
            Button(action: {
                
                let monthGuessAsInteger = Int(monthGuess)
                
                if monthGuessAsInteger < target {
                    feedback = "After"
                }
                else if monthGuessAsInteger > target {
                    feedback = "Before"
                }
                else if monthGuessAsInteger == target {
                    feedback = "Special"
                }
            }, label: {
                Text("Submit")
            })
                .buttonStyle(.bordered)
                .padding()
            
            
            Text (feedback)
                .italic()
                .padding()
            
            Spacer()
            
        }
        .navigationTitle("SpecialDay")
    }
       
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ContentView()
        }
    }
}
