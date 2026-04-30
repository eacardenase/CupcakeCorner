//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Edwin Cardenas on 4/29/26.
//

import SwiftUI

struct CheckoutView: View {
    let order: Order
    @State private var confirmationTitle = ""
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false

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
                    Task {
                        await placeOrder()
                    }
                }
                .buttonStyle(.borderedProminent)
                .buttonSizing(.flexible)
            }
            .padding()
        }
        .navigationTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .alert(confirmationTitle, isPresented: $showingConfirmation) {
        } message: {
            Text(confirmationMessage)
        }
    }

    func placeOrder() async {
        guard let encodedOrder = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")

            return
        }

        // let url = URL(string: "https://reqres.in/api/cupcakes")!
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        var request = URLRequest(url: url)

        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"

        do {
            let (data, _) = try await URLSession.shared.upload(
                for: request,
                from: encodedOrder
            )

            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)

            confirmationTitle = "Thank you!"
            confirmationMessage =
                "Your order for \(decodedOrder.quantity) x \(Order.types[decodedOrder.type]) cupcakes is on its way!"
        } catch {
            confirmationTitle = "An error ocurred"
            confirmationMessage =
                "Checkout failed: \(error.localizedDescription)"
        }

        showingConfirmation = true
    }
}

#Preview {
    CheckoutView(order: Order())
}
