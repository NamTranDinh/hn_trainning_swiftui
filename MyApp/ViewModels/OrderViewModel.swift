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
    
    func addToOrder(item: Appetizer, completed: () -> Void, failured: () -> Void) {
        if let data = UserDefaults.standard.data(forKey: "orders"),
            var appetizersInStore = try? JSONDecoder().decode([Appetizer].self, from: data) {
            
            appetizersInStore.append(item)
            self.appetizersInStore.append(item)
            
            if let updatedData = try? JSONEncoder().encode(appetizersInStore) {
                UserDefaults.standard.set(updatedData, forKey: "orders")
                completed()
            } else {
                failured()
            }
        } else {
            let newAppetizers = [item]
            if let newData = try? JSONEncoder().encode(newAppetizers) {
                UserDefaults.standard.set(newData, forKey: "orders")
                self.appetizersInStore = newAppetizers
                completed()
            } else {
                failured()
            }
        }
    }
}
