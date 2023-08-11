/*
  AnimationView.swift
 
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Nguyen Anh Duy
  ID: 3878141
  Created  date: 02/08/2023
  Last modified: 07/08/2023
  Acknowledgement:
  - Custom Splash Screen: https://www.youtube.com/watch?v=0ytO3wCRKZU&ab_channel=Indently 
*/

import SwiftUI

struct AnimationView: View {
    // State variables to define the initial value of logo size, position, angles, and opacity for later animation modified
    @State private var isSplashActive = false
    @State private var size = 0.2
    @State private var angle: Double = 1
    @State private var opacity = 0.2
    
    var body: some View {
        // Check if the splash screen is available or disabled (only appeared once for each time the app start/restart)
        if (isSplashActive) {
            ContentView()
        } else {
            ZStack {
                Color(.white)
                    .edgesIgnoringSafeArea(.all)
                Image("whisk-logo-white")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 400)
                // Set Animation Effects for logo
                    .scaleEffect(size)
                    .rotationEffect(Angle(degrees: angle))
                    .opacity(opacity)
                    .onAppear{
                        // Perform the series of animated action by adjusting the self-defined variables
                        withAnimation(.easeIn(duration: 1.5)) {
                            self.size = 1.0
                            self.opacity = 1.0
                            self.angle = 360
                        }
                    }
            }
            .onAppear {
                // After the animation screen appear, delay for 2 seconds until disabled and navigate to the next view
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isSplashActive = true
                    }
                }
            }
        }
    }
}

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}
