//
//  AppetizersViewMModel.swift
//  MyApp
//
//  Created by Nam. Tran Dinh - CMC Global DKR1 on 28/2/25.
//

import SwiftUI

final class AppetizersViewMModel: ObservableObject {
    
    static let shared = AppetizersViewMModel()
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertMessage: AlertMessage?
    @Published var networkProgress: NetworkProgress = .initial
    
    func getAppetizers() {
        self.networkProgress = .loading
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            NetworkManager.shared.getAppetizers { result in
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
}
