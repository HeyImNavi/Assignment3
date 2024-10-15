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
            
            //TextField for Interest
            
            //TextField for Annnual Rates
            
            //TextField for # of Years
            
            //Calculate Button
            
            //Push Text to the top of the screen
            Spacer()
        }//end of VStack
    }//end of body View
}//end of struct View

#Preview {
    MortControlView()
}//end of Preview
