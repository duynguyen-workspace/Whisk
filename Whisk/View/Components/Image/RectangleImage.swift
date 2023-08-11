/*
  RectangleImage.swift
 
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Nguyen Anh Duy
  ID: 3878141
  Created  date: 01/08/2023
  Last modified: 10/08/2023
  Acknowledgement: Lecturer's Example - Week 4 Lab Tutorial
*/

import SwiftUI

struct RectangleImage: View {
    let image: Image
    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 3)
    }
}

struct RectangleImage_Previews: PreviewProvider {
    static var previews: some View {
        RectangleImage(image: Image("ameretto"))
    }
}
