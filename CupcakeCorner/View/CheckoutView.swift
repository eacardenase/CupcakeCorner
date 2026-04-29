//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Edwin Cardenas on 4/29/26.
//

import SwiftUI

struct CheckoutView: View {
    let order: Order

    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(
                    url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"),
                    scale: 3
                ) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .clipShape(.rect(cornerRadius: 8))
                } placeholder: {
                    ProgressView()
                }
                .containerRelativeFrame(.vertical) { size, axis in
                    size * 0.3
                }

                Text(
                    "Your total is \(order.cost, format: .currency(code: "USD"))"
                )
                .font(.title)

                Button("Place Order") {

                }
                .buttonStyle(.borderedProminent)
                .buttonSizing(.flexible)
            }
            .padding()
        }
        .navigationTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
    }
}

#Preview {
    CheckoutView(order: Order())
}
