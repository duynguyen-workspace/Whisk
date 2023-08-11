/*
  MapAnnotationView.swift
 
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Nguyen Anh Duy
  ID: 3878141
  Created  date: 07/08/2023
  Last modified: 07/08/2023
  Acknowledgement:
  - Custom Map Annotation Icon UI Design:  https://www.youtube.com/watch?v=DHpL8yz6ot0&ab_channel=iOSAcademy
*/

import SwiftUI

struct MapAnnotationView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .foregroundColor(Color("primary-color"))
                    .frame(width: 30, height: 30)
                Image(systemName: "wineglass")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .font(.headline)
                    .foregroundColor(colorScheme == .dark ? .black : .white)
            }
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 10, height: 10)
                .foregroundColor(Color("primary-color"))
                .rotationEffect(Angle(degrees: 180))
                .offset(y:-12)
        }
    }
}

struct MapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        MapAnnotationView()
    }
}
