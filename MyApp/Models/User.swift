//
//  User.swift
//  MyApp
//
//  Created by Nam. Tran Dinh - CMC Global DKR1 on 5/3/25.
//

import Foundation


class User : Codable {
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    var birthday: Date = Date()
    var extraNapkins: Bool = false
    var frequentRefills: Bool = false
}
