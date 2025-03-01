//
//  APError.swift
//  MyApp
//
//  Created by Nam. Tran Dinh - CMC Global DKR1 on 20/2/25.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToCompleteRequest
    case decodingError
    case genericError
    case timeoutError
    case unauthorizedAccess
    case serverError
}

enum NetworkProgress {
    case initial
    case loading
    case success
    case failure
}
