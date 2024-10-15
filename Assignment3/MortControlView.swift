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
    var body: some View {
        
        VStack {
            //Title Text
            Text("Loan Calculator")
                //Properties for Title
                .font(.title)
                .bold()
                .multilineTextAlignment(.center)
                .padding()
            
            //Push Text to the top of the screen
            Spacer()
        }//end of VStack
    }//end of body View
}//end of struct View

#Preview {
    MortControlView()
}//end of Preview
