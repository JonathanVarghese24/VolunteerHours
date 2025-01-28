//
//  ContentView.swift
//  Volunteer Hour App
//
//  Created by JV on 1/27/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isAnimating = false

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [.orange, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()

                VStack {
                    Spacer()

                    VStack {
                        Text("Community")
                            .font(.custom("SauceBarbe", size: 70))
                            .foregroundColor(.white)
                        Text("Connect")
                            .font(.custom("SauceBarbe", size: 70))
                            .foregroundColor(.white)
                    }
                    .opacity(isAnimating ? 1 : 0)
                    .offset(y: isAnimating ? 0 : -50)
                    .animation(.easeOut(duration: 1), value: isAnimating)

                    Spacer()

                    NavigationLink(destination: VolunteerView()) {
                        Text("Opportunities")
                            .font(.custom("SauceBarbe", size: 24))
                            .padding()
                            .background(Color.yellow)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                    .scaleEffect(isAnimating ? 1 : 0.8)
                    .opacity(isAnimating ? 1 : 0)
                    .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0).delay(0.5), value: isAnimating)

                    Spacer()
                }
            }
            .navigationBarHidden(true)
            .onAppear {
                isAnimating = true
            }
        }
    }
}

#Preview {
    ContentView()
}
