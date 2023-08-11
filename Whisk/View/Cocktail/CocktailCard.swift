/*
  CocktailCard.swift
 
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Nguyen Anh Duy
  ID: 3878141
  Created  date: 02/08/2023
  Last modified: 11/08/2023
  Acknowledgement:
  - UI Design ideas: {URL}
*/

import SwiftUI

struct CocktailCard: View {
    @Binding var isDark: Bool // Access the State variable from CocktailList to identify the current color scheme
    let cocktail: Cocktail
    
    var body: some View {
        // Scrolling Page
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                // Card Top Banner (Cocktail Image)
                cocktail.image
                    .resizable()
                    .aspectRatio(1.0, contentMode: ContentMode.fit)
                // Card details (Cocktail's data)
                ZStack {
                    Color("bg-color")
                        .clipShape(RoundedRectangle(cornerRadius: 40))
                    VStack {
                        HStack {
                            Spacer()
                            Circle()
                                .frame(width: 60)
                                .foregroundColor(Color("bg-color"))
                                .shadow(radius: 1)
                                .overlay(
                                    Image(systemName: cocktail.isFavourite ? "heart.fill" : "heart")
                                        .foregroundColor(.red)
                                        .font(.system(size: 30))
                                )
                        }
                        .padding(.trailing,30)
                        Spacer()
                    }
                    .offset(y: -30)
                    
                    // Basic Information
                    VStack(alignment: .leading, spacing: 5) {
                        CaptionTextView(displayedText: cocktail.type.capitalized, color: .black)
                            .offset(y: 10)
                        HStack(alignment: .top) {
                            TitleTextView(displayedText: cocktail.name, color: Color("primary-color"))
                        }
                        HStack() {
                            Text("(\(cocktail.rating))")
                                .font(.system(size: 14))
                            RatingView(rating: cocktail.rating, starSize: 15)
                            
                        }
                        VStack(alignment: .leading, spacing: 10) {
                            HStack(alignment: .top) {
                                HeadingTextView(displayedText: "Ingredients", color: Color("heading-color"))
                                Text("( \(cocktail.alcoholPercentage, specifier: "%.2f")% Alcolhol)")
                                    .font(.custom("PlayfairDisplay-Regular", size: 15))
                            }
                            IngredientsView(ingredients: cocktail.ingredients, columns: 3)
                        }
                        .padding([.top, .bottom], 15)
                        Divider()
                        // Cocktail's description
                        VStack(alignment: .leading, spacing: 10) {
                            HeadingTextView(displayedText: "Description", color: Color("heading-color"))
                            Text(cocktail.description)
                                .font(.custom("PlayfairDisplay-Regular", size: 18))
                        }
                        Divider()
                        // Cocktail's best location to find
                        VStack(alignment: .leading, spacing: 10) {
                            HeadingTextView(displayedText: "Best Location", color: Color("heading-color"))
                            HStack() {
                                Image(cocktail.address.barImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .frame(width: 350)
                            }
                            HStack {
                                Image(systemName: "menucard.fill")
                                    .foregroundColor(Color("secondary-color"))
                                    .font(.title2)
                                Text(cocktail.address.barName)
                                    .font(.custom("PlayfairDisplay-Medium", size: 20))
                            }
                            HStack {
                                Image(systemName: "location.circle.fill")
                                    .foregroundColor(Color("secondary-color"))
                                    .font(.title2)
                                Text("No. \(cocktail.address.number), \(cocktail.address.street) Street, District \(cocktail.address.district)")
                                    .font(.custom("PlayfairDisplay-Medium", size: 16))
                            }
                            
                            // Cocktail's location map (with pin)
                            MapView(coordinate: cocktail.locationCoordinates)
                                .frame(height: 300)
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                                .shadow(radius: 3)
                        }
                    }
                    .padding([.top,.horizontal])
                }
                .offset(y: -30)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .environment(\.colorScheme, isDark ? .dark : .light) // Adjust the view accordingly based on the color scheme
    }
}

struct CocktailCard_Previews: PreviewProvider {
    static var previews: some View {
        CocktailCard(isDark: .constant(false), cocktail: cocktails[0])
    }
}
