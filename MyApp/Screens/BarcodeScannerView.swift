//
//  BarcodeScannerView.swift
//  MyApp
//
//  Created by Nam. Tran Dinh - CMC Global DKR1 on 12/2/25.
//

import SwiftUI

struct BarcodeScannerView: View {
    var body: some View {
        NavigationView(content: {
            VStack (alignment: .center) {
                ScannerView()
                    .frame(maxWidth: .infinity, maxHeight: 300)
                
                Spacer().frame(height: 42)
                
                Label("Scan Barcode :", systemImage: "barcode.viewfinder")
                    .font(.title2)
                    .bold()
                
                Text("Not Yet Scanned")
                    .bold()
                    .font(.largeTitle)
                    .padding()
                    .foregroundColor(.red)
            }
            .navigationTitle("Barcode Scanner")
            
        })
    }
}



#Preview {
    BarcodeScannerView()
}
