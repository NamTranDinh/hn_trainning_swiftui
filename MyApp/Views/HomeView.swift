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
                }
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
    }
    
    var body: some View {
        ZStack {
            AppetizerList()
            
            if (viewmodel.networkProgress == .loading) {
                LoadingOverlayView()
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
            AsyncImage(url: URL(string: appetizer.imageURL)) { phase in
                switch phase {
                case .failure:
                    Image(systemName: "photo")
                        .frame(width: 128, height: 100)
                        .background(.gray.opacity(0.3))
                        .clipShape(.rect(cornerRadius: 16))
                        .font(.largeTitle)
                case .success(let image):
                    image
                        .resizable()
                        .frame(width: 128, height: 100)
                        .background(.gray.opacity(0.3))
                        .clipShape(.rect(cornerRadius: 16))
                        .font(.largeTitle)
                default:
                    ProgressView()
                        .frame(width: 128, height: 100)
                        .background(.gray.opacity(0.3))
                        .clipShape(.rect(cornerRadius: 16))
                }
            }
            
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
                // Action to continue shopping
                print("Continue Shopping tapped")
            }) {
                Text("Continue Shopping")
                    .fontWeight(.semibold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.top, 20)
        }
        .padding()
    }
}

