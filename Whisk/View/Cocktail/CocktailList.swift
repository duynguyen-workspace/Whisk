/*
  CocktailList.swift
 
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Nguyen Anh Duy
  ID: 3878141
  Created  date: 01/08/2023
  Last modified: 11/08/2023
  Acknowledgement:
  - Custom Bottom Sheet & Toggle Button: https://www.youtube.com/watch?v=gw2k-sXTEyI
  - Light/Dark Theme & Toggle Button: https://www.youtube.com/watch?v=b5KZqZYvKmg
  - Search Bar using .searchable modifier: https://www.hackingwithswift.com/quick-start/swiftui/how-to-add-a-search-bar-to-filter-your-data, https://www.youtube.com/watch?v=iTqwa0DCIMA
  - Favourite Filter Toggle Button: https://www.youtube.com/watch?v=dGyQoLHhzN0
  - NavigationStack & Toolbar: https://holyswift.app/how-to-create-toolbar-in-swiftui/
*/

import SwiftUI

struct CocktailList: View {
    @State var isDark = false // store the status of the light/dark color scheme
    @State var isSheetPresented = false // store the active status of displaying the account view's sheet
    @State var searchName = "" // store the user's input text for searching results
    @State var showFavouriteOnly = false // store the active status of the 'favourite only' option
    var body: some View {
        VStack {
            NavigationStack {
                List {
                    // Toggle button to display list of favourite items (cocktails)
                    Toggle(isOn: $showFavouriteOnly) {
                        Text("Favourite Cocktails")
                            .font(.custom("PlayfairDisplay-Medium", size: 18))
                    }
                    // Iterate through the list of searched items in the list
                    ForEach(searchCocktails, id: \.self) { cocktail in
                        // Check if the favourite button is toggled
                        if !self.showFavouriteOnly || cocktail.isFavourite {
                            NavigationLink(destination: CocktailCard(isDark: $isDark, cocktail: cocktail)
                                .navigationTitle(cocktail.name)
                                .navigationBarTitleDisplayMode(.inline)
                            ,label: {
                                CocktailRow(cocktail: cocktail)
                            })
                        }
                    }
                }
                // Top Navigation Bar to display the buttons
                .toolbar {
                    // Account View sheet toggle button on the left-haded side of the navigation bar
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            isSheetPresented.toggle()
                        } label: {
                            Image(systemName: "person.circle.fill")
                                .foregroundColor(!isDark ? .black : .white)
                                .font(.system(size: 20))
                        }
                        .sheet(isPresented: $isSheetPresented) {
                            AccountView()
                                .presentationDetents([.large])
                                .presentationDragIndicator(.visible)
                        }
                    }
                    // Dark Mode toggle button on the right-handed side of navigation bar
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            isDark.toggle()
                        } label: {
                            // Display the icon accordingly based on the color scheme
                            if !isDark {
                                Image(systemName: "moon.fill")
                                    .foregroundColor(.black)
                                    .font(.system(size: 20))
                            } else {
                                Image(systemName: "sun.min")
                                    .foregroundColor(.white)
                                    .font(.system(size: 20))
                            }
                        }
                    }
                }
                .navigationTitle("Let's Whisk")
            }
            .environment(\.colorScheme, isDark ? .dark : .light) // modify the color sheme based on the state variable
            .searchable(text: $searchName) // Appear the search bar with the search text compared to the struct data (cocktail's name)
        }
    }
    // Variable stores the search results of the list
    var searchCocktails: [Cocktail] {
        // Check the content of the search bar
        if searchName.isEmpty {
            return cocktails
        } else {
            // If the search text field contains text --> filter the list if the struct data contains the searched text (if the cocktail's name contains the searched text)
            return cocktails.filter {
                // Check for case insensitive
                $0.name.localizedCaseInsensitiveContains(searchName)
            }
        }
    }
}

struct CocktailList_Previews: PreviewProvider {
    static var previews: some View {
        CocktailList()
    }
}
