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
    @State private var interest: Double = 0.0 //holds interest rate
    
    /*
    @State private var annRate =  "" //holds annual rate
    @State private var years = "" //holds # of years
    */
     
    @State private var resultText = "0.00" //holds calculated result
    @State private var errorMessage = "" //holds error message
    
    @State private var showAlert = false //flag to check if an alert should be shown
    @State private var calculate = false //flag to check if calculate should be active
    @State private var isEditing = false //flag to check if editing is valid
    
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
            
            //Slider
            Slider(
                value: $interest,
                in: 1...30,
                onEditingChanged: { editing in
                    isEditing = editing
                }//end of onEditingChanged
            )
            
            /*
            //TextField for # of Years
            TextField("Number of Years", text: $years)
            //properties for width text field
                .keyboardType(.decimalPad)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
             */
            
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
        
        //Display error message
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Error"), message: Text(errorMessage))
        }//end of alert
        
    }//end of body View
    
    //compute the value of the monthly loan
    func compute() -> Bool {
        
        //getting value for initalMortage
        guard let P = Double(iniMort) else {//error check initialMortgage
            errorMessage = "Please enter a valid value for the Initial Mortgage"
            showAlert = true
            return false
        }//end of else statement
        
        //value for interest
        var R = interest
        
        //variable to hold the result
        var result: Double
        
        result = 1.0
        
        //Calculate result
        result = P + R
        
        //Update resultText
        resultText = String(format: "%.2f", result)
        
        //Compute function works
        return true
    }//end of compute
}//end of struct View

#Preview {
    MortControlView()
}//end of Preview
