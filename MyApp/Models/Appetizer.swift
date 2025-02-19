//
//  Appetizer.swift
//  MyApp
//
//  Created by Nam. Tran Dinh - CMC Global DKR1 on 20/2/25.
//

import Foundation

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct Appetizer: Codable, Hashable {
    let protein, carbs: Int
    let imageURL: String
    let description: String
    let price: Double
    let name: String
    let id, calories: Int
}

struct MockDataAppetizers {
    static let sampleAppetizers: [Appetizer] = [
        Appetizer(
            protein: 25,
            carbs: 15,
            imageURL: "https://images.pexels.com/photos/842711/pexels-photo-842711.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
            description: "Grilled chicken skewers with a spicy dipping sauce.",
            price: 9.99,
            name: "Grilled Chicken Skewers",
            id: 1,
            calories: 300
        ),
        Appetizer(
            protein: 15,
            carbs: 10,
            imageURL: "https://images.pexels.com/photos/1525041/pexels-photo-1525041.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
            description: "Crispy veggie spring rolls served with sweet chili sauce.",
            price: 7.99,
            name: "Veggie Spring Rolls",
            id: 2,
            calories: 200
        ),
        Appetizer(
            protein: 20,
            carbs: 12,
            imageURL: "https://images.pexels.com/photos/1379636/pexels-photo-1379636.jpeg?auto=compress&cs=tinysrgb&w=400",
            description: "A selection of fine cheeses served with crackers.",
            price: 11.99,
            name: "Cheese Platter",
            id: 3,
            calories: 450
        ),
        Appetizer(
            protein: 10,
            carbs: 25,
            imageURL: "https://images.pexels.com/photos/1643409/pexels-photo-1643409.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
            description: "Toasted bread topped with fresh tomatoes and basil.",
            price: 6.99,
            name: "Bruschetta",
            id: 4,
            calories: 150
        ),
        Appetizer(
            protein: 30,
            carbs: 5,
            imageURL: "https://images.pexels.com/photos/1148998/pexels-photo-1148998.jpeg?auto=compress&cs=tinysrgb&w=400",
            description: "Chilled shrimp served with cocktail sauce.",
            price: 12.99,
            name: "Shrimp Cocktail",
            id: 5,
            calories: 250
        )
    ]
}
