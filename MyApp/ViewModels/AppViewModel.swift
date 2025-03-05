//
//  TabViewModel.swift
//  MyApp
//
//  Created by Nam. Tran Dinh - CMC Global DKR1 on 5/3/25.
//

import Foundation

class AppViewModel: ObservableObject {
    @Published var selectedTabIndex: Int = 0
    
    // Static constant for the singleton instance
    static let shared = AppViewModel()
    
    // Private initializer to prevent creating new instances
    private init() {}
    
    func selectTab(at index: Int) {
        self.selectedTabIndex = index
    }
}
