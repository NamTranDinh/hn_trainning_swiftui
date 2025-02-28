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
    var loadingStatus: NetworkProgress = .initial

    
    func getAppetizers(completion: @escaping () -> Void) {
            loadingStatus = .loading
            // Notify that loading has started
            completion() // Notify the UI to update (e.g., show a loading spinner)

            NetworkManager.shared.getAppetizers { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let appetizers):
                        self.appetizers = appetizers
                        self.loadingStatus = .success
                        // Notify that loading has finished successfully
                        completion() // Notify the UI to update
                    case .failure(let error):
                        self.appetizers.removeAll()
                        self.loadingStatus = .failure
                        // Notify that loading has finished with failure
                        completion() // Notify the UI to update
                        print(error.localizedDescription)
                    }
                }
            }
        }
    
    
}
