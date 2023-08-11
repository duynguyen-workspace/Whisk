/*
  CocktailRow.swift
 
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Nguyen Anh Duy
  ID: 3878141
  Created  date: 02/08/2023
  Last modified: 11/08/2023
  Acknowledgement:
  - UI Design ideas: Lecturer's Example for Assignment 1, Lecturer's Example - Week 4 Lab Tutorial
*/

import SwiftUI

struct CocktailRow: View {
    let cocktail: Cocktail
    
    var body: some View {
        HStack(alignment: .center) {
            RectangleImage(image: cocktail.image)
                .frame(width: 60, height: 60)
            VStack(alignment: .leading) {
                Text(cocktail.name)
                    .font(.custom("PlayfairDisplay-SemiBold", size: 20))
                Text(cocktail.type.capitalized)
                    .foregroundColor(Color("caption-color"))
                    .font(.custom("PlayfairDisplay-Bold", size: 12))
                RatingView(rating: cocktail.rating, starSize: 10)
                .offset(y:3)
            }
            .padding(.leading, 15)
            Spacer()
            Button {
                // No Action
            } label: {
                HeartBoxView(isFilled: cocktail.isFavourite)
            }
        }
    }
}

struct CocktailRow_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            CocktailRow(cocktail: cocktails[8])
        }
    }
}
