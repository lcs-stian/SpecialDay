//
//  ContentView.swift
//  SpecialDay
//
//  Created by Suzanne Tian on 2021-12-10.
//

import SwiftUI

struct ContentView: View {
    
    @State var monthGuess: Double = 6.0
    let target1 = 2
    
    @State var dateGuess: Double = 1.0
    let target2 = 18
    
    @State var feedback = ""
    
    
    var body: some View {
        VStack (alignment:.leading, spacing: 10){
            
        
            Text("Month")
                .font(.title)
                .padding(.bottom, 3)
            
            Slider(value: $monthGuess,
                   in: 1.0...12.0,
                   step: 1.0,
                   label: {
                Text("Guess")
            },
                   minimumValueLabel: {
                Text("1")
            },
                   maximumValueLabel: {
                Text("12")
            })
                .padding()
            
            Text ("\(String(format: "%.f", monthGuess))")
             
            
            Stepper("Date",
                    value: $dateGuess,
                    in: 1.0...31.0,
                    step: 1.0)
                .font(.title)
                .padding(.bottom, 3)
            
            Text ("\(String(format: "%.f", dateGuess))")
            
            
            Button(action: {
                
                let monthGuessAsInteger = Int(monthGuess)
                
                if monthGuessAsInteger < target1 {
                    feedback = "After"
                }
                else if monthGuessAsInteger > target1 {
                    feedback = "Before"
                }
                else if monthGuessAsInteger == target1 {
                    feedback = "Special"
                }
                
                let dateGuessAsInteger = Int(dateGuess)
                
                if dateGuessAsInteger < target2 {
                    feedback = "After"
                }
                else if dateGuessAsInteger > target2 {
                    feedback = "Before"
                }
                else if dateGuessAsInteger == target2 {
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
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ContentView()
        }
    }
}
