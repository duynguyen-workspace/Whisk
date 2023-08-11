/*
  AccountView.swift
 
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Nguyen Anh Duy
  ID: 3878141
  Created  date: 03/08/2023
  Last modified: 07/08/2023
  Acknowledgement:
  - UI Design Ideas: https://kiranworkspace.com/downloads/profile-card-ui-design-sass-bootstrap-4/
*/

import SwiftUI

struct AccountView: View {
    var body: some View {
        VStack(spacing: 0) {
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 180)
                .foregroundColor(Color("primary-color"))
            VStack(spacing: 0) {
                CircleImage(image: Image("avatar"))
                Text("Nguyen Anh Duy")
                    .font(.custom("PlayfairDisplay-ExtraBold", size: 30))
                Text("s3878141")
                    .font(.custom("Roboto-Regular", size: 20))
                VStack {
                    InfoView(icon: Image(systemName: "phone.fill"), info: "0903953008")
                    InfoView(icon: Image(systemName: "mail.fill"), info: "duynguyen-workspace")
                    InfoView(icon: Image(systemName: "mappin.and.ellipse"), info: "Ho Chi Minh City")
                }
                .padding([.top,.bottom], 20)
                HStack {
                    CircleImage(image: Image("whisk-logo"))
                        .frame(width: 100)
                    VStack {
                        Text("My Program: Let's Whisk")
                            .bold()
                            .font(.custom("PlayfairDisplay-ExtraBold", size: 20))
                            .padding(.bottom, 5)
                        Text("Let's WhisK is an application that showcases a variety of cocktails and also the best locations(bars) to have a taste of them")
                            .font(.custom("Roboto-Regular", size: 16))
                    }
                    .padding(.horizontal,15)
                }
                .padding([.top,.horizontal], 10)
            }
            .offset(y:-130)
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
