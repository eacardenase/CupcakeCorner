//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Edwin Cardenas on 4/27/26.
//

import SwiftUI

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct Response: Codable {
    var results: [Result]
}

struct ContentView: View {
    @State private var results = [Result]()

    var body: some View {
        List(results, id: \.trackId) { item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)

                Text(item.collectionName)
                    .font(.subheadline)
            }
        }
        .task {
            await loadData()
        }
    }

    func loadData() async {
        guard
            let url = URL(
                string:
                    "https://itunes.apple.com/search?term=taylor+swift&entity=song"
            )
        else {
            print("Invalid URL")

            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(Response.self, from: data)

            results = response.results
        } catch {
            print("Invalid data.")
        }
    }
}

#Preview {
    ContentView()
}
