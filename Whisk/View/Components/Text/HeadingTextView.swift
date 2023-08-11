/*
  HeadingTextView.swift
 
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

struct HeadingTextView: View {
    let displayedText: String
    let color: Color
    
    var body: some View {
        Text(displayedText)
            .font(.custom("PlayfairDisplay-Medium", size: 25))
            .foregroundColor(color)
            .bold()
    }
}

struct HeadingTextView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingTextView(displayedText: "Ameretto", color: .black)
    }
}
