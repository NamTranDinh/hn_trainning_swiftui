//
//  ScannerView.swift
//  MyApp
//
//  Created by Nam. Tran Dinh - CMC Global DKR1 on 18/2/25.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    
    var barcodeViewModel: BarcodeScannerViewModel
    
    func makeUIViewController(context: Context) -> ScannerVC {
        ScannerVC(scannerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(barcodeViewModel: self.barcodeViewModel)
    }
    
    final class Coordinator: NSObject, ScannerVCDelegate {
        private let barcodeViewModel: BarcodeScannerViewModel
        
        init(barcodeViewModel: BarcodeScannerViewModel) {
            self.barcodeViewModel = barcodeViewModel
        }
        
        func didFind(barcode: String) {
            barcodeViewModel.scannedBarcode = barcode
            print("ScannerView: didScan result: \(barcode)")
        }
        
        func didFail(with error: CameraError) {
            switch error {
            case .invalidDeviceInput:
                barcodeViewModel.alertMessage = AlertContent.invalidDeviceInput
            case .invalidScanValue:
                barcodeViewModel.alertMessage = AlertContent.invalidScanValue
            case .unableToInitialize:
                barcodeViewModel.alertMessage = AlertContent.unableToInitialize
            }
            print("ScannnerView: didFail \(error)")
        }
    }
}

#Preview {
    ScannerView(barcodeViewModel: BarcodeScannerViewModel())
}
