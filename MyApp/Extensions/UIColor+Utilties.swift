//
//  Color+Utilties.swift
//  MyApp
//
//  Created by Nam. Tran Dinh - CMC Global DKR1 on 6/2/25.
//

import SwiftUI

extension Color {
    init(_ red: CGFloat,_ green: CGFloat,_ blue: CGFloat) {
        self.init(red: red / 255.0, green: green / 255.0, blue: blue / 255.0)
    }
}
