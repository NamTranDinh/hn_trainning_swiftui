//
//  NetworkExeption.swift
//  MyApp
//
//  Created by NAM TRAN on 1/3/25.
//

import Foundation
import SwiftUI

struct ErrorMessage {
    let title: String
    let message: String
    let dissmissButton: Alert.Button
}


struct NetworkExeption {
    
    static func getNetworkException(from error: NetworkError) -> AlertMessage? {
        switch error {
        case .invalidURL:
            return invalidURL
        case .invalidResponse:
            return invalidResponse
        case .invalidData:
            return invalidData
        case .unableToCompleteRequest:
            return unableToCompleteRequest
        case .decodingError:
            return decodingError
        case .genericError:
            return genericError
        case .timeoutError:
            return timeOutError
        case .unauthorizedAccess:
            return unauthorizedAccess
        case .serverError:
            return serverError
        }
        
    }
    
    static private let invalidURL: AlertMessage = .init(
        title: "Invalid URL",
        message: "The URL you provided is not valid. Please check the URL and try again.",
        dissmissButton: .default(Text("OK"))
    )
    
    static private let invalidResponse: AlertMessage = .init(
        title: "Invalid Server Response",
        message: "The server responded with an unexpected or invalid format. Please try again later.",
        dissmissButton: .default(Text("OK"))
    )
    
    static private let invalidData: AlertMessage = .init(
        title: "Invalid Data",
        message: "The data received from the server could not be processed. Please try again later.",
        dissmissButton: .default(Text("OK"))
    )
    
    static private let unableToCompleteRequest: AlertMessage = .init(
        title: "Network Error",
        message: "Unable to complete your request. Please check your internet connection and try again.",
        dissmissButton: .default(Text("OK"))
    )
    
    static private let decodingError: AlertMessage = .init(
        title: "Data Decoding Error",
        message: "An error occurred while decoding the data. Please try again.",
        dissmissButton: .default(Text("OK"))
    )
    
    static private let genericError: AlertMessage = .init(
        title: "An Error Occurred",
        message: "Something went wrong. Please try again.",
        dissmissButton: .default(Text("OK"))
    )
    
    static private let timeOutError: AlertMessage = .init(
        title: "Request Timeout",
        message: "The request timed out. Please check your network connection and try again.",
        dissmissButton: .default(Text("OK"))
    )
    
    static private let unauthorizedAccess: AlertMessage = .init(
        title: "Unauthorized Access",
        message: "You do not have permission to access this resource.",
        dissmissButton: .default(Text("OK"))
    )
    
    static private let serverError: AlertMessage = .init(
        title: "Server Error",
        message: "An internal server error occurred. Please try again later.",
        dissmissButton: .default(Text("OK"))
    )
}
