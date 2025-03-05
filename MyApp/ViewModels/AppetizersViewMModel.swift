//
//  AppetizersViewMModel.swift
//  MyApp
//
//  Created by Nam. Tran Dinh - CMC Global DKR1 on 28/2/25.
//

import SwiftUI

final class AppetizersViewMModel: ObservableObject {
    
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
    
    func addToOrder(item: Appetizer, orderVm: OrderViewModel) {
        orderVm.addToOrder(item: item) {
            alertMessage = OrderMessgaeContext.addItemSuccessfully
        } failured: {
            alertMessage = OrderMessgaeContext.addItemFailure
        }
    }
}
