//
//  TempControlView.swift
//  Assignment3
//
//  CCSI 321 - Assignment 3
//  Created by Aaron Arreola and Calvin Darley
//  Due 10/29/2024
//
//

import SwiftUI

enum Temp: String, Identifiable, CaseIterable {
    var id: String { self.rawValue }
    
    case Farenheight
    case Celsius
}

struct TempControlView: View {
    
    @State private var selectedTemp = 0
    
    var temperatures = [Array(-129...134), Array(-90...57)]
    
    var body: some View {
        
        VStack {
            //Title Text
            Text("Temperature Conversion")
                //Properties for Title
                .font(.title)
                .bold()
                .multilineTextAlignment(.center)
                .padding()
            
            //Picker to choose the temperature
            Picker("Temp", selection: $selectedTemp) {
                //ForEach Loop
                Text("\u{2109} \u{2B62} \u{2103}").tag(0)
                Text("\u{2103} \u{2B62} \u{2109}").tag(1)
            }//end of Picker
                //properties of the picker
                .padding(.horizontal)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 2)
                )
                .pickerStyle(.segmented)
            
            //check to see what temperature conversion they wanted
            if selectedTemp == 0 {
                
            }//end of if statement
            else if selectedTemp == 1 {
                
            }//end of else if statement
            
            //Push text to the top of screen
            Spacer()
            
        }//end of VStack
    }//end of body View
}//end of struct View

#Preview {
    TempControlView()
}//end of Preview
