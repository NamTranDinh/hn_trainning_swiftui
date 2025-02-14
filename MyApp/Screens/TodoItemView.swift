//
//  TodoItemView.swift
//  MyApp
//
//  Created by Nam. Tran Dinh - CMC Global DKR1 on 7/2/25.
//

import SwiftUI

struct TodoItemView: View {
    
    let title: String
    
    var body: some View {
        HStack {
            Image(systemName: "checkmark.circle")
            Text(title)
            Spacer()
        }
        .padding(.vertical, 8)
    }
}


struct TodoItemView_previews: PreviewProvider {
    static var previews: some View {
        TodoItemView(title: "This is the first item!")
    }
}

