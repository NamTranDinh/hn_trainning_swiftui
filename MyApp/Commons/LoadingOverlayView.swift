//
//  LoadingOverlayView.swift
//  MyApp
//
//  Created by Nam. Tran Dinh - CMC Global DKR1 on 28/2/25.
//

import SwiftUI

struct LoadingIndicator: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.color = UIColor(named: "brandColor")
        activityIndicatorView.startAnimating()
        return activityIndicatorView
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        
    }
}

struct LoadingOverlayView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground.withAlphaComponent(0.0))
                .edgesIgnoringSafeArea(.all)
            LoadingIndicator()
        }
    }
}

#Preview {
    LoadingOverlayView()
}
