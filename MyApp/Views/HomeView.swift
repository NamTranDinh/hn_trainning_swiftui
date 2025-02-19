//
//  HomeView.swift
//  MyApp
//
//  Created by Nam. Tran Dinh - CMC Global DKR1 on 19/2/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView(content: {
            Text("Hello, HomeView!")
                .navigationTitle("🍿 Appetizers")
        })
    }
}

#Preview {
    HomeView()
}
