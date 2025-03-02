//
//  ScannerCodeErrorContext.swift
//  MyApp
//
//  Created by NAM TRAN on 2/3/25.
//

import Foundation
import SwiftUI


struct ScannerCodeErrorContext {
    static let invalidScanValue: AlertMessage = .init(
        title: "Invalid Scan Value",
        message: "Something is wrong with the camera. We can't scan this code",
        dissmissButton: .default(Text("OK"))
    )
    
    static let invalidDeviceInput: AlertMessage = .init(
        title: "Invalid Device Input",
        message: "The value scanned is not a valid barcode. This app only supports EAN-8 and EAN-13",
        dissmissButton: .default(Text("OK"))
    )
    
    static let unableToInitialize: AlertMessage = .init(
        title: "Unable to Initialize",
        message: "Unable to initialize the camera. Please try again later.",
        dissmissButton: .default(Text("OK"))
    )
}
