//
//  BarcodeScannerViewModel.swift
//  MyApp
//
//  Created by Nam. Tran Dinh - CMC Global DKR1 on 19/2/25.
//

import SwiftUI

final class BarcodeScannerViewModel: ObservableObject {
    @Published var isShowingAlert: Bool = false
    var alertMessage: AlertMessage?
    var scannedBarcode: String = ""
    
    
    func resultText() -> String {
        return scannedBarcode.isEmpty ? "Not Yet Scanned" : scannedBarcode
    }
    
    func resutlTextColor() -> Color {
        return scannedBarcode.isEmpty ? .red : .green
    }
}
