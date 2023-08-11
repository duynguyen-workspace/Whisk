/*
  IngredientsView.swift
 
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Nguyen Anh Duy
  ID: 3878141
  Created  date: 02/08/2023
  Last modified: 11/08/2023
  Acknowledgement:
  - LazyVGrid for IngredientsView: Swift Playgrounds - Playground Name: Organizing with Grids
*/

import SwiftUI

struct IngredientsView: View {
    @Environment(\.colorScheme) var colorScheme // Keep track of the color scheme to set the color accordingly
    let ingredients: [String] // Array stores a list of ingredients name (String)
    let columns: Int // Number of columns for the grid layout
    
    var body: some View {
        // Display cocktail's ingredients in a 3-columns grid layout
        LazyVGrid(columns: Array(repeating: GridItem(), count: columns)) {
            // Iterate through the array 
            ForEach(ingredients, id: \.self) { ingredient in
                Capsule()
                    .foregroundColor(Color("secondary-color"))
                    .frame(height: 30)
                    .overlay(
                        Text(ingredient)
                            .font(.custom("PlayfairDisplay-SemiBold", size: 15))
                            .foregroundColor(Color(colorScheme == .dark ? .black : .white))
                    )
            }
        }
    }
}

struct IngredientsView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsView(ingredients: cocktails[0].ingredients, columns: 3)
    }
}
