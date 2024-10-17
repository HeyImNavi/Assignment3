//
//  MortControlView.swift
//  Assignment3
//
//  CCSI 321 - Assignment 3
//  Created by Aaron Arreola and Calvin Darley
//  Due 10/29/2024
//
//

import SwiftUI

struct MortControlView: View {
    
    //variables
    @State private var iniMort = "" //holds initial mortgage
    @State private var interest = "" //holds interest rate
    @State private var annRate =  "" //holds annual rate
    @State private var years = "" //holds # of years
    @State private var resultText = "0.00" //holds calculated result
    
    @State private var errorMessage = "" //holds error message
    
    @State private var showAlert = false //flag to check if an alert should be shown
    @State private var calculate = false //flag to check if calculate should be active
    
    var body: some View {
        
        VStack {
            //Title Text
            Text("Loan Calculator")
                //Properties for Title
                .font(.title)
                .bold()
                .multilineTextAlignment(.center)
                .padding()
            
            //TextField for Inital Mortgage
            TextField("Initial Mortgage", text: $iniMort)
            //properties for width text field
                .keyboardType(.decimalPad)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            
            //TextField for Interest
            TextField("Interest", text: $interest)
            //properties for width text field
                .keyboardType(.decimalPad)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            
            //TextField for Annnual Rates
            TextField("Annual Rate", text: $annRate)
            //properties for width text field
                .keyboardType(.decimalPad)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            
            //TextField for # of Years
            TextField("Number of Years", text: $years)
            //properties for width text field
                .keyboardType(.decimalPad)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            
            //Calculate Button
            Button("Compute Area") {
                if compute() {
                    calculate = true
                }//end of compute
            }//end of button
                //properties of button
                .background (
                    Color.white
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                        .frame(width: 140,height: 50))
                .foregroundColor(.black)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .padding(.vertical)

            //checks if calculate is true
            if calculate == true {
                Text("Monthly Payment = $\(resultText)")
                //properties of area text
                    .font(.title2)
                    .bold()
                    .padding(.top)
            }//end of if statement
            
            //Push Text to the top of the screen
            Spacer()
        }//end of VStack
    }//end of body View
    
    //compute the value of the monthly loan
    func compute() -> Bool {
        
        //getting value for initalMortage
        guard let initialMortgage = Double(iniMort) else {//error check radius
            errorMessage = "Please enter a valid value for the Initial Mortgage"
            showAlert = true
            return false
        }//end of else statement
        
        //getting value for P
        guard let P = Double(iniMort) else {//error check radius
            errorMessage = "Please enter a valid value for the Initial Mortgage"
            showAlert = true
            return false
        }//end of else statement
        
        var result: Double
        
        result = 1.0
        
        //Calculate result
        
        resultText = String(format: "%.2f", result)
        
        return true
    }//end of compute
}//end of struct View

#Preview {
    ContentView()
}//end of Preview
