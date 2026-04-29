//
//  Order.swift
//  CupcakeCorner
//
//  Created by Edwin Cardenas on 4/28/26.
//

import SwiftUI

@Observable
class Order {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]

    var type = 0
    var quantity = 1
    var name = ""
    var streetAddress = ""
    var city = ""
    var zipCode = ""

    var extraFrosting = false
    var addSprinkles = false
    var specialRequestEnabled = false {
        didSet {
            if !specialRequestEnabled {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }

    var hasValidAddress: Bool {
        if name.isEmpty
            || streetAddress.isEmpty
            || city.isEmpty
            || zipCode.isEmpty
        {
            return false
        }

        return true
    }

    var cost: Decimal {
        var cost = Decimal(quantity) * 2

        cost += Decimal(type) / 2

        if extraFrosting {
            cost += Decimal(quantity)
        }

        if addSprinkles {
            cost += Decimal(quantity) / 2
        }

        return cost
    }
}
