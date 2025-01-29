//
//  Opportunity.swift
//  Volunteer Hour App
//
//  Created by JV on 1/28/25.
//

import Foundation

struct Opportunity: Identifiable, Decodable {
    let id = UUID()
    let name: String
    let description: String
    let date: String
    let time: String
    let location: String
    let link: String

    enum CodingKeys: String, CodingKey {
        case name = "Opportunity Name"
        case description = "Description"
        case date = "Date"
        case time = "Time"
        case location = "Location"
        case link = "Link"
    }
}
