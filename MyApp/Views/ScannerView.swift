//
//  ScannerView.swift
//  MyApp
//
//  Created by Nam. Tran Dinh - CMC Global DKR1 on 18/2/25.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ScannerVC {
        ScannerVC(scannerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    final class Coordinator: NSObject, ScannerVCDelegate {
        func didFind(barcode: String) {
            print("ScannerView: didScan result: \(barcode)")
        }
        
        func didFail(with error: CameraError) {
            print("ScannnerView: didFail \(error)")
        }
    }
}

#Preview {
    ScannerView()
}
