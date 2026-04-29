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
        Form {
            Text(order.name)
            Text(order.streetAddress)
        }
        .navigationTitle("Checkout")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CheckoutView(order: Order())
}
