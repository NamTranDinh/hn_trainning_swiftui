//
//  FrameWorkGridViewModel.swift
//  MyApp
//
//  Created by Nam. Tran Dinh - CMC Global DKR1 on 11/2/25.
//

import SwiftUI

final class FrameWorkGridViewModel: ObservableObject {
    var selectedFramework: Framework? {
        didSet {
            isShowingFrameworkDetail = true
        }
    }
    
    
    @Published var isShowingFrameworkDetail: Bool = false
    
}
