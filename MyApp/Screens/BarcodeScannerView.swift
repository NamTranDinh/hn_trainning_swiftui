//
//  BarcodeScannerView.swift
//  MyApp
//
//  Created by Nam. Tran Dinh - CMC Global DKR1 on 12/2/25.
//

import SwiftUI

struct BarcodeScannerView: View {
    
    
    @StateObject var barcodeViewModel : BarcodeScannerViewModel = BarcodeScannerViewModel()
    
    var body: some View {
        NavigationView(content: {
            VStack (alignment: .center) {
                ScannerView(
                    barcodeViewModel: barcodeViewModel
                )
                .frame(maxWidth: .infinity, maxHeight: 300)
                
                Spacer().frame(height: 42)
                
                Label("Scan Barcode :", systemImage: "barcode.viewfinder")
                    .font(.title2)
                    .bold()
                
                Text(barcodeViewModel.scannedBarcode.isEmpty ? "Not Yet Scanned" : barcodeViewModel.scannedBarcode)
                    .bold()
                    .font(.largeTitle)
                    .padding()
                    .foregroundColor(barcodeViewModel.scannedBarcode.isEmpty ? .red : .green)
                
            }
            .navigationTitle("Barcode Scanner")
            .alert(isPresented: $barcodeViewModel.isShowingAlert, content: {
                Alert(
                    title: Text(barcodeViewModel.alertMessage!.title),
                    message: Text(barcodeViewModel.alertMessage!.message),
                    dismissButton: barcodeViewModel.alertMessage!.dissmissButton
                )
            })
            
        })
    }
}



#Preview {
    BarcodeScannerView(barcodeViewModel: BarcodeScannerViewModel())
}
