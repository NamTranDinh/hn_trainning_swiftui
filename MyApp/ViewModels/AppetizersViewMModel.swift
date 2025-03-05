//
//  AppetizersViewMModel.swift
//  MyApp
//
//  Created by Nam. Tran Dinh - CMC Global DKR1 on 28/2/25.
//

import SwiftUI

final class AppetizersViewMModel: ObservableObject {
    
    static let shared = AppetizersViewMModel()
    
    @Published var appetizerDetail: Appetizer?
    @Published var appetizers: [Appetizer] = []
    @Published var alertMessage: AlertMessage?
    @Published var networkProgress: NetworkProgress = .initial
    
    func getAppetizers() {
        self.networkProgress = .loading
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.sync {
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                    self.networkProgress = .success
                    self.alertMessage = nil
                case .failure(let error):
                    self.appetizers.removeAll()
                    self.alertMessage = NetworkExeption.getNetworkException(from: error)
                    self.networkProgress = .failure
                }
            }
        }
    }
    
    func addToOrder(item: Appetizer) {
        if let data = UserDefaults.standard.data(forKey: "orders"),
           var appetizersInStore = try? JSONDecoder().decode([Appetizer].self, from: data) {
            
            appetizersInStore.append(item)
            
            if let updatedData = try? JSONEncoder().encode(appetizersInStore) {
                UserDefaults.standard.set(updatedData, forKey: "orders")
                alertMessage = OrderMessgaeContext.addItemSuccessfully
            }
        } else {
            let newAppetizers = [item]
            if let newData = try? JSONEncoder().encode(newAppetizers) {
                UserDefaults.standard.set(newData, forKey: "orders")
                alertMessage = OrderMessgaeContext.addItemSuccessfully
            }
        }
    }
}
