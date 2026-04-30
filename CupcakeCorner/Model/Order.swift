//
//  Order.swift
//  CupcakeCorner
//
//  Created by Edwin Cardenas on 4/28/26.
//

import SwiftUI

@Observable
class Order: Codable {
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
        if name.trimmingCharacters(in: .whitespaces).isEmpty
            || streetAddress.trimmingCharacters(in: .whitespaces).isEmpty
            || city.trimmingCharacters(in: .whitespaces).isEmpty
            || zipCode.trimmingCharacters(in: .whitespaces).isEmpty
            || streetAddress.trimmingCharacters(in: .whitespaces).isEmpty
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

    enum CodingKeys: String, CodingKey {
        case _type = "type"
        case _quantity = "quantity"
        case _specialRequestEnabled = "specialRequestEnabled"
        case _extraFrosting = "extraFrosting"
        case _addSprinkles = "addSprinkles"
        case _name = "name"
        case _city = "city"
        case _streetAddress = "streetAddress"
        case _zipCode = "zipCode"
    }
}
