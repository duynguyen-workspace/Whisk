/*
  InfoView.swift
 
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Nguyen Anh Duy
  ID: 3878141
  Created  date: 09/08/2023
  Last modified: 09/08/2023
  Acknowledgement: None
*/

import SwiftUI

struct InfoView: View {
    let icon: Image
    let info: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(Color("secondary-color"))
            .frame(width: 300, height: 40)
            .overlay(
                HStack {
                    icon
                        .foregroundColor(.white)
                        .padding(.trailing, 15)
                    Text(info)
                        .font(.custom("Roboto-Regular", size: 20))
                        .foregroundColor(.white)
                    Spacer()
                }
                    .padding(.leading, 20)
            )
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(icon: Image(systemName: "heart.fill"), info: "0903953008")
    }
}
