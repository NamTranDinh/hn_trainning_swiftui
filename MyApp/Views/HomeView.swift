//
//  HomeView.swift
//  MyApp
//
//  Created by Nam. Tran Dinh - CMC Global DKR1 on 19/2/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewmodel: AppetizersViewMModel = AppetizersViewMModel.shared
    
    fileprivate func AppetizerList() -> some View {
        return NavigationView {
            if (viewmodel.appetizers.isEmpty && viewmodel.networkProgress == .success) ||  viewmodel.networkProgress == .failure {
                EmptyCartView()
            } else {
                List(viewmodel.appetizers, id: \.id) { appetizer in
                    AppetizerItem(appetizer: appetizer)
                        .onTapGesture {pGesture in
                            viewmodel.appetizerDetail = appetizer
                        }
                }
                .disabled(viewmodel.appetizerDetail != nil)
                .navigationBarTitle(Text("Appetizers"))
                .scrollContentBackground(.hidden)
                .listStyle(.sidebar)
                .contentMargins(.zero)
                .refreshable {
                    getData()
                }
                
            }
        }
        .alert(item: $viewmodel.alertMessage) { alert in
            Alert(
                title: Text(alert.title),
                message: Text(alert.message),
                dismissButton: alert.dissmissButton
            )
        }
        .onAppear{
            getData()
            
        }
        .blur(radius: viewmodel.appetizerDetail == nil ? 0 : 10)
    }
    
    var body: some View {
        ZStack {
            AppetizerList()
            
            if (viewmodel.networkProgress == .loading) {
                LoadingOverlayView()
            }
            
            if viewmodel.appetizerDetail != nil {
                AppetizerDetailView(
                    appreciater: viewmodel.appetizerDetail!,
                    viewModel: viewmodel
                )
            }
        }
    }
    
    func getData() {
        viewmodel.getAppetizers()
    }
}

#Preview {
    HomeView()
}

struct AppetizerItem: View {
    
    let appetizer: Appetizer
    
    var body: some View {
        HStack(alignment: .center) {
            AppetizerImage(url: appetizer.imageURL)
                .frame(width: 128, height: 100)
                .background(.gray.opacity(0.3))
                .clipShape(.rect(cornerRadius: 16))
                .font(.largeTitle)
            
            VStack(alignment: .leading) {
                Text(appetizer.name)
                    .bold()
                Text("$\(appetizer.price, specifier: "%.2f")")
                    .font(.caption)
            }
            
            Spacer()
        }
    }
}

#Preview {
    AppetizerItem(appetizer: MockDataAppetizers.sampleAppetizers.first!)
}

struct EmptyCartView: View {
    private var tabVM = TabViewModel.shared
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

