//
//  OrderViewModel.swift
//  MyApp
//
//  Created by Nam. Tran Dinh - CMC Global DKR1 on 5/3/25.
//

import Foundation
import SwiftUI

class OrderViewModel : ObservableObject {
    @Published var appetizersInStore: [Appetizer] = []
    
    
    func getAppetizersInStore() {
        if let data = UserDefaults.standard.data(forKey: "orders") {
            if let decodedAppetizers = try? JSONDecoder().decode([Appetizer].self, from: data) {
                self.appetizersInStore = decodedAppetizers
            }
        }
    }
    
    func onDeleteItem(at indexSet: IndexSet) {
        appetizersInStore.remove(atOffsets: indexSet)
        if let data = try? JSONEncoder().encode(appetizersInStore) {
            UserDefaults.standard.set(data, forKey: "orders")
        }
    }
}
