//
//  Appetizers.swift
//  MyApp
//
//  Created by Nam. Tran Dinh - CMC Global DKR1 on 19/2/25.
//

import SwiftUI

struct AppetizersTabView: View {
    
    @StateObject private var tabVM = AppViewModel.shared
    @StateObject private var orderVM = OrderViewModel()
    
    init() {
        setupTabBarTheme()
    }
    
    var body: some View {
        TabView(selection: $tabVM.selectedTabIndex) {
            HomeView()
                .tag(0)
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
            
            AccountView()
                .tag(1)
                .tabItem{
                    Image(systemName: "person")
                    Text("Account")
                }
            
            OrderView()
                .tag(2)
                .badge(orderVM.appetizersInStore.count)
                .tabItem{
                    Image(systemName: "bag")
                    Text("Order")
                }
        }
        .environmentObject(orderVM)
        .ignoresSafeArea()
        .accentColor(Color("brandColor"))
        .onAppear {
            orderVM.getAppetizersInStore()
        }
    }
    
    func setupTabBarTheme() {
        UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance()
    }
}

#Preview {
    AppetizersTabView()
}
