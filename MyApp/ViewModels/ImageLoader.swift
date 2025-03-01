//
//  ImageLoader.swift
//  MyApp
//
//  Created by NAM TRAN on 1/3/25.
//

import Foundation
import SwiftUI

final class ImageLoader: ObservableObject {
    @Published var image: Image? = nil
    
    func load(url: String) {
        NetworkManager.shared.downloadImage(from: url) { uiImage in
            guard let uiImage = uiImage else { return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}

struct RemoteImage: View {
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}

struct AppetizerImage: View {

    @StateObject var loader: ImageLoader = ImageLoader()
    let url: String
    
    var body: some View {
        RemoteImage(image: loader.image)
            .onAppear{
                loader.load(url: url)
            }
    }
}
