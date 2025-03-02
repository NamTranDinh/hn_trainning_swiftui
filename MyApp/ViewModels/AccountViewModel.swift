//
//  AccountViewModel.swift
//  MyApp
//
//  Created by NAM TRAN on 2/3/25.
//

import Foundation

final class AccountViewModel : ObservableObject {
    public static let shared = AccountViewModel()
    
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
    @Published var birthday: Date = Date()
    @Published var extraNapkins: Bool = false
    @Published var frequentRefills: Bool = false
    
    @Published var alertMessage: AlertMessage?
    
    var isValidForm: Bool {
        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else {
            alertMessage = FormErrorContext.invalidForm
            return false
        }
        guard email.isValidEmail else {
            alertMessage = FormErrorContext.invalidEmail
            return false
        }
        alertMessage = nil
        return true
    }
    
    func saveChanges() {
        guard isValidForm else {
            return
        }
        
    }
    
}
