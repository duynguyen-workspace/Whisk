/*
  MapView.swift
 
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Nguyen Anh Duy
  ID: 3878141
  Created  date: 31/07/2023
  Last modified: 10/08/2023
  Acknowledgement:
  - MapView: Lecturer's Example - Week 4 Lab Tutorial
  - MapView with custom annotation button - https://www.hackingwithswift.com/quick-start/swiftui/how-to-show-annotations-in-a-map-view

*/

import SwiftUI
import MapKit

struct MapView: View {
    // Store the coordinate and region location of the data
    var coordinate: CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion()

    var body: some View {
        // Display the map and the annotation icon of the current location given the list of structs (data)
        Map(coordinateRegion: $region, annotationItems: cocktails) {_ in
            MapAnnotation(coordinate: coordinate) {
                MapAnnotationView()
            }
        }
        .onAppear {
            setRegion(coordinate)
        }
    }
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 10.782327682472374, longitude: 106.70478049085048))
    }
}
