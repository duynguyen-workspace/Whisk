/*
  ContentView.swift
 
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Nguyen Anh Duy
  ID: 3878141
  Created  date: 31/07/2023
  Last modified: 10/08/2023
  Acknowledgement:
  - Welcome Page: Lecturer's Example - Week 4 & 5 Lab Tutorial
*/

import SwiftUI

struct ContentView: View {
    @State var isWelcomeActive: Bool = true
    var body: some View {
        VStack {
            ZStack {
                // Check if welcome page is already shown or not
                if isWelcomeActive {
                    WelcomeView(active: $isWelcomeActive)
                } else {
                    CocktailList()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
