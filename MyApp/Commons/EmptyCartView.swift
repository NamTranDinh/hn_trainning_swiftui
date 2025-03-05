//
//  EmptyCartView.swift
//  MyApp
//
//  Created by NAM TRAN on 5/3/25.
//

import SwiftUI

struct EmptyCartView: View {
    
    private var tabVM = AppViewModel.shared
    
    var body: some View {
        VStack {
            Image(systemName: "cart.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.gray)
            
            Text("Your cart is empty")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 20)
            
            Text("Looks like you haven't added anything yet.")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.top, 5)
            
            Button(action: {
                // 0 -> HomeView
                // 1 -> AccountView
                // 2 -> OrderView
                tabVM.selectTab(at: 0)
            }) {
                Text("Continue Shopping")
                    .fontWeight(.semibold)
                    .padding()
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity)
            .background(Color("brandColor"))
            .cornerRadius(10)
            .padding(.top, 20)
        }
        
        .padding()
    }
}

#Preview {
    EmptyCartView()
}
