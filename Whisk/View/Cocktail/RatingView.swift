/*
  RatingView.swift
 
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

struct RatingView: View {
    let rating: Int
    let starSize: Int
    
    var body: some View {
        HStack() {
            // Display filled stars according to the ratings
            ForEach(1...rating, id: \.self) {_ in
                Image(systemName: "star.fill")
                    .font(.system(size: CGFloat(starSize)))
                    .foregroundColor(Color("icon-color"))
            }
            // Display the remaining unfilled stars if rating less than 5
            if (rating < 5) {
                let unFilledStars = 5 - rating
                ForEach(1...unFilledStars, id: \.self) {_ in
                    Image(systemName: "star")
                        .font(.system(size: CGFloat(starSize)))
                        .foregroundColor(Color("icon-color"))
                }
            }
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: 1, starSize: 10)
    }
}
