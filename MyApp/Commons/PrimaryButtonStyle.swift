//
//  PrimaryButtonStyle.swift
//  MyApp
//
//  Created by NAM TRAN on 5/3/25.
//

import SwiftUI

struct PrimaryButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(Color("brandColor"))
            .controlSize(.regular)
    }
}
