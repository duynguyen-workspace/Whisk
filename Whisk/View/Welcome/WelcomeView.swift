/*
  WelcomeView.swift
 
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Nguyen Anh Duy
  ID: 3878141
  Created  date: 02/08/2023
  Last modified: 07/08/2023
  Acknowledgement:
  - UI Design Ideas: {URL}
  - Custom bottom SwiftUI Sheet: https://www.youtube.com/watch?v=gw2k-sXTEyI
*/

import SwiftUI

struct WelcomeView: View {
    // State variable to store the sheet toggle option
    @State private var isSheetPresented = false
    // State variable to check if the welcome view is available or disabled
    @Binding var active: Bool
    var body: some View {
        ZStack {
            Color("primary-color")
            VStack{
                RectangleImage(image: Image("rmit-logo-white"))
                    .frame(width: 200, height: 200)
                    .offset(x: -20, y: 20)
                Spacer()
                ZStack {
                    CircleImage(image: Image("whisk-logo"))
                        .frame(width: 300)
                        .overlay(Circle().stroke(.white,lineWidth: 5)
                            .frame(width: 300))
                        .shadow(color: .white,radius: 5)
                        .padding(.bottom)
                    HStack {
                        Spacer()
                        // Toggle Button to show the sheet with creator information (AccountView)
                        Button {
                            isSheetPresented.toggle()
                        } label: {
                            Image(systemName: "info.circle.fill")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                        }
                        .offset(x: -60, y: 140)
                        // Displaying the sheet in large size
                        .sheet(isPresented: $isSheetPresented) {
                            AccountView()
                                .presentationDetents([.large]) // Large Scaled Sheet View only
                                .presentationDragIndicator(.visible) // Display the drag icon on the top
                        }
                    }
                }
                Spacer()
                Text("\"A cocktail masterpiece can tell stories about your personality\"")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                    .font(.custom("Roboto-Regular",size: 18))
                    .foregroundColor(.white)
                Text("Take a whisk, shall we?")
                    .bold()
                    .padding([.top, .bottom], 15)
                    .font(.custom("PlayfairDisplay-Bold",size: 32))
                    .foregroundColor(.white)
                
                Spacer()
                // Toggle button to close the welcome view (disabled by update the active status)
                Button(action: {
                    active = false
                }, label: {
                    ButtonView(displayedText: "Get Started", color: "primary-color")
                })
            }
            .padding([.top,.bottom],20)
        }
        .edgesIgnoringSafeArea(.all)
    }
        
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(active: .constant(true))
    }
}
