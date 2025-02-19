//
//  APError.swift
//  MyApp
//
//  Created by Nam. Tran Dinh - CMC Global DKR1 on 20/2/25.
//

import Foundation

enum APError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToCompleteRequest
}

enum NetworkProgress {
    case initial
    case loading
    case success
    case failure
}
