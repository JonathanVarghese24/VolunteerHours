//
//  VolunteerView.swift
//  Volunteer Hour App
//
//  Created by JV on 1/27/25.
//

import SwiftUI

extension View {
    func navigationBarTitleColor(_ color: Color) -> some View {
        self.modifier(NavigationBarTitleColorModifier(color: color))
    }
}

struct NavigationBarTitleColorModifier: ViewModifier {
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .navigationBarTitleDisplayMode(.inline)
            .toolbarColorScheme(.dark, for: .navigationBar)
    }
}

struct VolunteerView: View {
    @State private var opportunities: [Opportunity] = []
    @State private var isLoading = true

    var body: some View {
        ZStack {
            LinearGradient(colors: [.red, .black], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()

            if isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .scaleEffect(2)
            } else if opportunities.isEmpty {
                Text("No opportunities available.")
                    .foregroundColor(.white)
            } else {
                ScrollView {
                    LazyVStack(spacing: 20) {
                        ForEach(opportunities) { opportunity in
                            OpportunityCard(opportunity: opportunity)
                        }
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("Volunteer Opportunities")
        .navigationBarTitleColor(.white)
        .onAppear {
            fetchOpportunities()
        }
    }

    private func fetchOpportunities() {
        guard let url = URL(string: "https://sheet2api.com/v1/v6lQr4hlSh6V/community-connect") else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                return
            }

            guard let data = data else {
                print("No data received")
                return
            }

            do {
                let decodedData = try JSONDecoder().decode([Opportunity].self, from: data)
                DispatchQueue.main.async {
                    self.opportunities = decodedData
                    self.isLoading = false
                }
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }.resume()
    }
}

#Preview {
    VolunteerView()
}
