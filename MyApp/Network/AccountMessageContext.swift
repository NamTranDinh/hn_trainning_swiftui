//
//  FormErrorContext.swift
//  MyApp
//
//  Created by NAM TRAN on 2/3/25.
//

import Foundation
import SwiftUI

struct AccountMessageContext {
    static let saveUserSuccessfully: AlertMessage = .init(
        title: "Success",
        message: "User has been saved successfully!",
        dissmissButton: .default(Text("OK"))
    )

    static let saveUserFailure: AlertMessage = .init(
        title: "Error",
        message: "Failed to save user. Please try again.",
        dissmissButton: .default(Text("OK"))
    )
}
