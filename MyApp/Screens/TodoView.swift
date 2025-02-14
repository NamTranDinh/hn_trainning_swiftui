//
//  TodoView.swift
//  MyApp
//
//  Created by Nam. Tran Dinh - CMC Global DKR1 on 7/2/25.
//

import SwiftUI

struct TodoView: View {
    var body: some View {
        NavigationView(content: {
            ListRowView()
        })
    }
}


struct ListRowView: View {
    
    @State var items: [String] = [
        "This is the fisrt item!",
        "This is the second items!",
        "This is the third items!",
        "This is the fisrt item!",
        "This is the second items!",
        "This is the third items!",
        "This is the fisrt item!",
        "This is the second items!",
        "This is the third items!",
        "This is the fisrt item!",
        "This is the second items!",
        "This is the third items!",
        "This is the fisrt item!",
        "This is the second items!",
        "This is the third items!",
        "This is the fisrt item!",
        "This is the second items!",
        "This is the third items!",
        "This is the fisrt item!",
        "This is the second items!",
        "This is the third items!",
        "This is the fisrt item!",
        "This is the second items!",
        "This is the third items!",
        "This is the fisrt item!",
        "This is the second items!",
        "This is the third items!",
        "This is the fisrt item!",
        "This is the second items!",
        "This is the third items!",
        "This is the fisrt item!",
        "This is the fisrt item!",
        "This is the third items!",
        "This is the second items!",
        "This is the second items!",
        "This is the third items!"
    ]
    
    var body: some View {
        List(items.indices, id: \.self){ index in
            TodoItemView(title: "\(index + 1) - \(items[index])")
        }
        .navigationBarTitle(Text("TODO 📝"))
        .scrollContentBackground(.visible)
        .listStyle(.sidebar)
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink(
                destination: {Text("Desitination")},
                label: {Text("Add")}
            )
        )
    }
}


struct TodoView_Previews: PreviewProvider {
    static var previews: some View {
        TodoView()
    }
}
