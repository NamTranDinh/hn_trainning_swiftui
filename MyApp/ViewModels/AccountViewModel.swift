//
//  AccountViewModel.swift
//  MyApp
//
//  Created by NAM TRAN on 2/3/25.
//

import Foundation
import SwiftUI

final class AccountViewModel : ObservableObject {
    public static let shared = AccountViewModel()
    
    @Published var user: User = User()
    @Published var alertMessage: AlertMessage?
    
    func saveUserInfo() {
        guard isValidForm else {
            return
        }
        if let data = try? JSONEncoder().encode(self.user) {
            UserDefaults.standard.set(data, forKey: "userInfo")
            self.alertMessage = AccountMessageContext.saveUserSuccessfully
        } else {
            self.alertMessage = AccountMessageContext.saveUserFailure
        }
    }
    
    func retrieveUserInfo() -> User {
        if let data = UserDefaults.standard.data(forKey: "userInfo") {
            if let user = try? JSONDecoder().decode(User.self, from: data) {
                self.user = user
            }
        }
        return self.user
    }
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertMessage = FormErrorContext.invalidForm
            return false
        }
        guard user.email.isValidEmail else {
            alertMessage = FormErrorContext.invalidEmail
            return false
        }
        alertMessage = nil
        return true
    }
}
