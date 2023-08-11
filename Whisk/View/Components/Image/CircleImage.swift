/*
  CircleImage.swift
 
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Nguyen Anh Duy
  ID: 3878141
  Created  date: 31/07/2023
  Last modified: 10/08/2023
  Acknowledgement: Lecturer's Example - Week 4 Lab Tutorial
*/

import SwiftUI

struct CircleImage: View {
    let image: Image
    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .scaledToFit()
            .clipShape(Circle())
            .shadow(radius: 5)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("ameretto"))
    }
}
