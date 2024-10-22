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
    @State private var interest: Double = 1.0 //holds interest rate
    @State private var years: Double = 10 //holds # of years
    
     
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
            
            //Slider for Interest
            Slider(value: $interest, in: 1...20, minimumValueLabel: Text("1"), maximumValueLabel: Text("20")) {}//properties for slider
                .padding()
            
            HStack {
                //Text that displays text rate
                Text ("Annual Rate")
                    .frame(alignment: .leading) // Align text to the left
                    .bold()
                    .padding()
                
                //create spaces between elements
                Spacer()
                
                //Shows the interest
                Text(String(format: "%.2f%%", interest))
                    .frame(alignment: .trailing) // Align text to the right
                    .padding()
            }//end of HStack
            
            //Slider for Years
            Slider(value: $years, in: 10...30, step: 1, minimumValueLabel: Text("10"), maximumValueLabel: Text("30")){}
                //properties of slider
                .padding()
            
            HStack {
                //Text that displays text rate
                Text ("Number of Years")
                    .frame(alignment: .leading) // Align text to the left
                    .bold()
                    .padding()
                
                //create space between elements
                Spacer()
                
                //Shows the interest
                Text(String(format: "%.0f", years))
                    .frame(alignment: .leading) // Align text to the left
                    .padding()
            }//end of HStack
            
            //Calculate Button
            Button("Calculate") {
                if compute() {
                    calculate = true
                }//end of compute
            }//end of button
                //properties of button
                .background (
                    Color.black
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                        .frame(width: 110,height: 50))
                .foregroundColor(.white)
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
        
        //value for monthly interest
        let R = interest / 100.0 / 12.0
        
        //value for number of monthly payments
        let N = years * 12
        
        //variable to hold the result
        var result: Double
        
        let numerator = (P * R * pow(1.0 + R, Double(N)))
        let denominator = (pow(1.0 + R, Double(N)) - 1.0)
        
        //Calculate result
        result = (numerator / denominator)
        
        //Update resultText
        resultText = String(format: "%.2f", result)
        
        //Compute function works
        return true
    }//end of compute
}//end of struct View

#Preview {
    MortControlView()
}//end of Preview
