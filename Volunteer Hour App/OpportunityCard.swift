//
//  OpportunityCard.swift
//  Volunteer Hour App
//
//  Created by JV on 1/28/25.
//

import SwiftUI

struct OpportunityCard: View {
    let opportunity: Opportunity
    @State private var showDetailPopup = false // State to track whether the popup is shown

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(opportunity.name)
                .font(.custom("SauceBarbe", size: 24))
                .foregroundColor(.white)

            Text(opportunity.description)
                .font(.body)
                .foregroundColor(.white.opacity(0.8))
                .lineLimit(2) // Limit description to 2 lines

            HStack {
                Label(opportunity.date, systemImage: "calendar")
                Spacer()
                Label(opportunity.time, systemImage: "clock")
            }
            .font(.caption)
            .foregroundColor(.white.opacity(0.7))

            Label(opportunity.location, systemImage: "mappin.and.ellipse")
                .font(.caption)
                .foregroundColor(.white.opacity(0.7))

            if let url = URL(string: opportunity.link), !opportunity.link.isEmpty {
                Link("Sign Up", destination: url)
                    .font(.caption)
                    .foregroundColor(.blue)
                    .padding(.top, 5)
            }
        }
        .padding()
        .background(Color.black.opacity(0.3))
        .cornerRadius(15)
        .shadow(radius: 5)
        // Show popup when tapped
        .onTapGesture {
            showDetailPopup = true
        }
        // Full-screen popup for details
        .fullScreenCover(isPresented: $showDetailPopup) {
            OpportunityDetailPopup(opportunity: opportunity, isPresented: $showDetailPopup)
        }
    }
}

#Preview {
    OpportunityCard(opportunity:
        Opportunity(name: "Sample Event", description: "Description here.", date: "Feb 15", time: "3 PM", location: "Park", link: "https://example.com"))
}
