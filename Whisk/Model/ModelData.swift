/*
  ModelData.swift
 
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Nguyen Anh Duy
  ID: 3878141
  Created  date: 31/07/2023
  Last modified: 01/08/2023
  Acknowledgement:
  - Parsing data from JSON file: Lecturer's Example - Week 5 Lecture Slides & Lab Tutorial
*/

import Foundation

// List of cocktail structs after parsing from JSON file
var cocktails: [Cocktail] = decodeJsonFromJsonFile(jsonFileName: "cocktail.json")

/***
  @param T: an object (class or struct) that conforms to Codable  protocol
  @return: an array of T objects
 */
func decodeJsonFromJsonFile<T: Codable>(jsonFileName: String) -> [T] {
    // Check if the file is existed in the directory
    if let file = Bundle.main.url(forResource: jsonFileName, withExtension: nil){
        // Check if the file can be decodable
        if let data = try? Data(contentsOf: file) {
            do {
                let decoder = JSONDecoder()
                let decoded = try decoder.decode([T].self, from: data)
                return decoded
            } catch let error { // Display error message if JSON data is corrupted
                fatalError("Failed to decode JSON: \(error)")
            }
        }
    } else { // Display error message if file cannot found
        fatalError("Couldn't load \(jsonFileName) file")
    }
    return [] as [T]
}
