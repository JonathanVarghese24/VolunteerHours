//
//  OpportunityDetailPopup.swift
//  Volunteer Hour App
//
//  Created by JV on 1/29/25.
//

import SwiftUI

struct OpportunityDetailPopup: View {
    let opportunity: Opportunity
    @Binding var isPresented: Bool // Binding to control whether the popup is shown
    
    var body: some View {
        ZStack {
            // Darkened background with lower opacity
            Color.black.opacity(0.7) // Adjusted opacity for better visibility of background
                .edgesIgnoringSafeArea(.all)
                // Close popup when tapping outside the card
                .onTapGesture {
                    isPresented = false
                }

            VStack(alignment: .leading, spacing: 10) {
                Text(opportunity.name)
                    .font(.custom("SauceBarbe", size: 24)) // Smaller font size
                    .foregroundColor(.white)

                Text(opportunity.description)
                    .font(.subheadline) // Smaller font size
                    .foregroundColor(.white.opacity(0.8))

                HStack(spacing: 10) {
                    Label(opportunity.date, systemImage: "calendar")
                        .font(.caption) // Smaller font size
                        .foregroundColor(.white.opacity(0.7))
                    
                    Label(opportunity.time, systemImage: "clock")
                        .font(.caption) // Smaller font size
                        .foregroundColor(.white.opacity(0.7))
                    
                    Label(opportunity.location, systemImage: "mappin.and.ellipse")
                        .font(.caption) // Smaller font size
                        .foregroundColor(.white.opacity(0.7))
                }
                
                if let url = URL(string: opportunity.link), !opportunity.link.isEmpty {
                    Link("Sign Up", destination: url)
                        .font(.headline)
                        .foregroundColor(.blue)
                        .padding(.top, 5)
                }

                Button(action: { isPresented = false }) {
                    Text("Close")
                        .font(.headline) // Smaller font size
                        .frame(maxWidth:.infinity)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                }
            }
            .padding()
            .background(Color.black.opacity(0.9)) // Dark background for the popup
            .cornerRadius(20)
            .shadow(radius: 20)
            .padding(30)
        }
    }
}
