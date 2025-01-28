//
//  OpportunityCard.swift
//  Volunteer Hour App
//
//  Created by JV on 1/28/25.
//

import SwiftUI

struct OpportunityCard: View {
    let opportunity: Opportunity

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(opportunity.name)
                .font(.custom("SauceBarbe", size: 24))
                .foregroundColor(.white)

            Text(opportunity.description)
                .font(.body)
                .foregroundColor(.white.opacity(0.8))

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
        }
        .padding()
        .background(Color.black.opacity(0.3))
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}

#Preview {
    OpportunityCard(opportunity: Opportunity(name: "Sample Event", description: "Description here.", date: "Feb 15", time: "3 PM", location: "Park"))
}
