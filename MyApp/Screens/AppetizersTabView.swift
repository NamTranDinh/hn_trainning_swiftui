//
//  Appetizers.swift
//  MyApp
//
//  Created by Nam. Tran Dinh - CMC Global DKR1 on 19/2/25.
//

import SwiftUI

struct AppetizersTabView: View {
    
    @StateObject private var tabVM = TabViewModel.shared
    
    init(){
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
                .tabItem{
                    Image(systemName: "bag")
                    Text("Order")
                }
            
        }
        .ignoresSafeArea()
        .accentColor(Color("brandColor"))
        
    }
    
    func setupTabBarTheme() {
        UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance()
    }
}

#Preview {
    AppetizersTabView()
}
