//
//  NetworkManager.swift
//  MyApp
//
//  Created by Nam. Tran Dinh - CMC Global DKR1 on 20/2/25.
//

import Foundation
import SwiftUI

final class NetworkManager {
    static let shared = NetworkManager()
    private let cache: NSCache<NSString, UIImage> = NSCache()
    
    static let baseURL: String = "http://seanallen-course-backend.herokuapp.com/swiftui-fundamentals"
    
    static let appetizerURL: String = baseURL + "/appetizers"
        
    func getAppetizers(completed: @escaping (Result<[Appetizer], NetworkError>) -> Void) {
        guard let url = URL(string: NetworkManager.appetizerURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let _ = data else {
                completed(.failure(.unableToCompleteRequest))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let appetizerResponse: AppetizerResponse = try JSONDecoder().decode(AppetizerResponse.self, from: data)
                completed(.success(appetizerResponse.request))
            } catch {
                completed(.failure(.invalidData))
            }
        }.resume()
    }
    
    func downloadImage(from url: String, completed: @escaping (UIImage?) -> Void) {
        
        let cacheKey = NSString(string: url)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: url) else {
            completed(nil)
            return
        }
        
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, res, error in
            guard let data = data else {
                completed(nil)
                return
            }
            
            let image = UIImage(data: data)
            
            self.cache.setObject(image!, forKey: cacheKey)
            
            DispatchQueue.main.async {
                completed(image)
            }
            
        }.resume()
    }
}
