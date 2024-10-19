//
//  TabControlView.swift
//  Assignment3
//
//  CCSI 321 - Assignment 3
//  Created by Aaron Arreola and Calvin Darley
//  Due 10/29/2024
//

import SwiftUI

struct TabControlView: View {
    var body: some View {
        
        //create tabs
        TabView {
            //Tab for Temperature
            TempControlView()
                //properties
                .tabItem {
                    Label("Temperature", systemImage: "thermometer.transmission")
                }//end of tabItems
            //Tab for Mortage
            MortControlView()
                //properties
                .tabItem {
                    Label("Mortgage", systemImage: "house.fill")
                }//end of tabItem
        }//end of TabView
    }//end of body View
}//end of struct View

#Preview {
    TabControlView()
}//end of Preview
