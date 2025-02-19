//
//  NetworkManager.swift
//  MyApp
//
//  Created by Nam. Tran Dinh - CMC Global DKR1 on 20/2/25.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    
    static let baseURL: String = "http://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    
    static let appetizerURL: String = baseURL + "/appetizers"
    
    private init() {
        
    }
    
    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void) {
        guard let url = URL(string: Self.appetizerURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completed(.failure(.unableToCompleteRequest))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let _ = String(data: data, encoding: .utf8) else {
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
    
    
}
