/*
  CaptionTextView.swift
 
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Nguyen Anh Duy
  ID: 3878141
  Created  date: 10/08/2023
  Last modified: 10/08/2023
  Acknowledgement: None
*/

import SwiftUI

struct CaptionTextView: View {
    let displayedText: String
    let color: Color
    
    var body: some View {
        Text(displayedText)
            .font(.custom("PlayfairDisplay-Regular", size: 25))
            .foregroundColor(color)
    }
}

struct CaptionTextView_Previews: PreviewProvider {
    static var previews: some View {
        CaptionTextView(displayedText: "Ameretto", color: .black)
    }
}
