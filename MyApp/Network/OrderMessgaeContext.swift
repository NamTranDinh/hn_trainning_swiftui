//
//  FormErrorContext.swift
//  MyApp
//
//  Created by NAM TRAN on 2/3/25.
//

import Foundation
import SwiftUI

struct OrderMessgaeContext {
    static let addItemSuccessfully: AlertMessage = .init(
        title: "Success",
        message: "The item has been added to your order successfully.",
        dissmissButton: .default(Text("OK"))
    )

    static let addItemFailure: AlertMessage = .init(
        title: "Error",
        message: "There was a problem adding the item to your order. Please try again.",
        dissmissButton: .default(Text("OK"))
    )
}
