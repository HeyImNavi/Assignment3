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
    @State private var pickerIndexF = 161
    @State private var pickerIndexC = 90
    @State private var convertedToC: Double = 0.0
    @State private var convertedToF: Double = 32.0
    @State private var temp: Double = 0.0
    
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
                VStack {
                    Picker("F to C", selection: $pickerIndexF) {
                        ForEach(0..<temperatures[0].count, id: \.self) { index in Text("\(temperatures[0][index]) \u{2109}")
                        }
                    }
                    .pickerStyle(.wheel)
                    .onChange(of: pickerIndexF) { value in
                        let temp = Double(temperatures[0][value])
                        
                        convertedToC = (temp - 32) * (5/9)
                    }
                    
                    
                    Text("\(convertedToC, specifier: "%.2f") \u{2103}")
                        .bold()
                }
                
            }//end of if statement
            else if selectedTemp == 1 {
                VStack {
                    Picker("F to C", selection: $pickerIndexC) {
                        ForEach(0..<temperatures[1].count, id: \.self) { index in Text("\(temperatures[1][index]) \u{2103}")
                        }
                    }
                    .pickerStyle(.wheel)
                    
                    .onChange(of: pickerIndexC) { value in
                        let temp = Double(temperatures[1][value])
                        
                        convertedToF = ((9/5) * temp) + 32
                    }
                    
                    
                    Text("\(convertedToF, specifier: "%.2f") \u{2109}")
                        .bold()
                }
            }//end of else if statement
            
            //Push text to the top of screen
            Spacer()
            
        }//end of VStack
    }//end of body View
}//end of struct View

#Preview {
    TempControlView()
}//end of Preview
