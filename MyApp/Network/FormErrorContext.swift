//
//  FormErrorContext.swift
//  MyApp
//
//  Created by NAM TRAN on 2/3/25.
//

import Foundation
import SwiftUI

struct FormErrorContext {
    static let invalidForm: AlertMessage = .init(
        title: "Invalid Form",
        message: "Please ensure all fields are filled correctly.",
        dissmissButton: .default(Text("OK"))
    )

    static let invalidEmail: AlertMessage = .init(
        title: "Invalid Email",
        message: "Please enter a valid email address.",
        dissmissButton: .default(Text("OK"))
    )

    static let passwordsDoNotMatch: AlertMessage = .init(
        title: "Passwords Do Not Match",
        message: "The passwords you entered do not match. Please try again.",
        dissmissButton: .default(Text("OK"))
    )

    static let usernameTaken: AlertMessage = .init(
        title: "Username Taken",
        message: "The username you entered is already in use. Please choose another.",
        dissmissButton: .default(Text("OK"))
    )

    static let genericFormError: AlertMessage = .init(
        title: "Form Error",
        message: "An error occurred while processing the form. Please try again.",
        dissmissButton: .default(Text("OK"))
    )

    static let invalidPhoneNumber: AlertMessage = .init(
        title: "Invalid Phone Number",
        message: "Please enter a valid phone number.",
        dissmissButton: .default(Text("OK"))
    )

    static let missingRequiredFields: AlertMessage = .init(
        title: "Missing Required Fields",
        message: "Please fill in all required fields.",
        dissmissButton: .default(Text("OK"))
    )
}
