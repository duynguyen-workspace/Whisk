/*
  Cocktail.swift
 
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Nguyen Anh Duy
  ID: 3878141
  Created  date: 31/07/2023
  Last modified: 10/08/2023
  Acknowledgement:
  - Model Struct for data: Lecturer's Example - Week 4 Lab Tutorial & Week 5 Lecture Slides
  - Conform Hashable Protocol: https://www.hackingwithswift.com/example-code/language/how-to-conform-to-the-hashable-protocol
*/

import Foundation
import SwiftUI
import CoreLocation

struct Cocktail: Identifiable, Codable, Hashable {
    // Attributes
    var id: Int
    var name: String
    var type: String
    var alcoholPercentage: Double
    var rating: Int
    var isFavourite: Bool
    var description: String
    var ingredients: [String]
    var imageName: String
    var image: Image {
        Image(imageName)
    }
    var address: Address
    var coordinates: Coordinates
    var locationCoordinates: CLLocationCoordinate2D { // Coordinates from Google Map
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
    
    // This function ensures the struct to conform the Identifiable and Codable protocol (make the struct comparable)
    static func == (lhs: Cocktail, rhs: Cocktail) -> Bool {
        return lhs.id == rhs.id
    }
    // This function ensures the struct to conform the Hashable protocol (in order to use item ForEach iterations)
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

// Store the address information of the cocktail's location (bar's information)
struct Address: Codable {
    var barName: String
    var barImage: String
    var number: Int
    var street: String
    var district: String
}

// Store the coordinates of the cocktail's location (bar)
struct Coordinates: Codable {
    var latitude: Double
    var longitude: Double
}
