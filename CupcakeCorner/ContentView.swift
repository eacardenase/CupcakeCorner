//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Edwin Cardenas on 4/27/26.
//

import SwiftUI

@Observable
class User: Codable {
    var name = "Taylor"

    enum CodingKeys: String, CodingKey {
        case _name = "name"
    }
}

struct ContentView: View {
    var body: some View {
        Button("Encode Taylor", action: encodeTaylor)
    }

    func encodeTaylor() {
        let data = try! JSONEncoder().encode(User())
        let str = String(decoding: data, as: UTF8.self)

        print(str)
    }
}

#Preview {
    ContentView()
}
