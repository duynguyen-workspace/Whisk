/*
  ButtonView.swift
 
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Nguyen Anh Duy
  ID: 3878141
  Created  date: 11/08/2023
  Last modified: 11/08/2023
  Acknowledgement: None
*/

import SwiftUI

struct ButtonView: View {
    let displayedText: String
    let color: String
    
    var body: some View {
        Capsule()
            .padding(10)
            .foregroundColor(.white)
            .frame(height:80)
            .overlay(
                Text(displayedText)
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(Color(color))
            )
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(displayedText: "Get Started", color: "primary-color")
    }
}
