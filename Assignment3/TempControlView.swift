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

struct TempControlView: View {
    var body: some View {
        
        VStack {
            //Title Text
            Text("Temperature Conversion")
                //Properties for Title
                .font(.title)
                .bold()
                .multilineTextAlignment(.center)
                .padding()
        }//end of VStack
        
        //Push text to the top of screen
        Spacer()
        
    }//end of body View
}//end of struct View

#Preview {
    TempControlView()
}//end of Preview
