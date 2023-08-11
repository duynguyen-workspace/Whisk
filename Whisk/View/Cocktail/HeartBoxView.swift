/*
  HeartBoxView.swift
 
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Nguyen Anh Duy
  ID: 3878141
  Created  date: 09/08/2023
  Last modified: 11/08/2023
  Acknowledgement: None
*/

import SwiftUI

struct HeartBoxView: View {
    let isFilled: Bool
    
    var body: some View {
        ZStack {
            Color("bg-color")
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .frame(width: 40, height: 40)
                .shadow(radius: 1)
            
            // Display the appropriate heart icon according to the favourite status of the cocktail
            if (isFilled) {
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
            } else {
                Image(systemName: "heart")
                    .foregroundColor(.red)
            }
            
        }
    }
}

struct HeartBoxView_Previews: PreviewProvider {
    static var previews: some View {
        HeartBoxView(isFilled: false)
    }
}
