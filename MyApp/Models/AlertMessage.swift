//
//  AlertMessage.swift
//  MyApp
//
//  Created by NAM TRAN on 2/3/25.
//

import Foundation
import SwiftUI

struct AlertMessage: Identifiable {
    let id: UUID = UUID()
    let title: String
    let message: String
    let dissmissButton: Alert.Button
}
