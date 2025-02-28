//
//  LoadingOverlayView.swift
//  MyApp
//
//  Created by Nam. Tran Dinh - CMC Global DKR1 on 28/2/25.
//

import SwiftUI

struct LoadingOverlay: View {
    var body: some View {
        Color.black.opacity(0.5)
            .ignoresSafeArea()
        VStack {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .scaleEffect(1.5, anchor: .center)
        }
    }
}
