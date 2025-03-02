//
//  String+Utilties.swift
//  MyApp
//
//  Created by NAM TRAN on 2/3/25.
//

import Foundation

extension String {
    var isEmptyOrWhitespace: Bool {
        return trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    var isValidEmail: Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return range(of: emailRegex, options: .regularExpression, range: nil, locale: nil) != nil
    }
    
    var isValidURL: Bool {
        return URL(string: self) != nil
    }
    
    var isValidDate: Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from: self) != nil
    }
    
    var isValidPhoneNumber: Bool {
        return self.count >= 10 && self.count <= 15
    }
    
    mutating func removeWhitespaces() {
        self = self.filter { !$0.isWhitespace }
    }
}
