//
//  AppetizersListView.swift
//  MyApp
//
//  Created by Nam. Tran Dinh - CMC Global DKR1 on 19/2/25.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var orderViewModel: OrderViewModel

    var body: some View {
        ZStack {
            NavigationStack {
                List {
                    ForEach(orderViewModel.appetizersInStore, id: \.id) { appetizer in
                        AppetizerItem(appetizer: appetizer)
                    }
                    .onDelete(perform: orderViewModel.onDeleteItem)
                }
                .navigationBarTitle(Text("🛍️ Order"))
                .scrollContentBackground(.hidden)
                .listStyle(.sidebar)
                .contentMargins(.zero)
            }
            
            if orderViewModel.appetizersInStore.isEmpty {
                EmptyCartView()
            }
        }
        .onAppear {
            orderViewModel.getAppetizersInStore()
        }
    }
}

#Preview {
    OrderView()
}
