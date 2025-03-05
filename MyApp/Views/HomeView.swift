//
//  HomeView.swift
//  MyApp
//
//  Created by Nam. Tran Dinh - CMC Global DKR1 on 19/2/25.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var appetizerVm = AppetizersViewMModel()
    
    fileprivate func AppetizerList() -> some View {
        return NavigationView {
            if (appetizerVm.appetizers.isEmpty && appetizerVm.networkProgress == .success) ||  appetizerVm.networkProgress == .failure {
                EmptyCartView()
            } else {
                List(appetizerVm.appetizers, id: \.id) { appetizer in
                    AppetizerItem(appetizer: appetizer)
                        .onTapGesture {pGesture in
                            appetizerVm.appetizerDetail = appetizer
                        }
                }
                .disabled(appetizerVm.appetizerDetail != nil)
                .navigationBarTitle(Text("Appetizers"))
                .scrollContentBackground(.hidden)
                .listStyle(.sidebar)
                .contentMargins(.zero)
                .refreshable {
                    getData()
                }
                
            }
        }
        .alert(item: $appetizerVm.alertMessage) { alert in
            Alert(
                title: Text(alert.title),
                message: Text(alert.message),
                dismissButton: alert.dissmissButton
            )
        }
        .onAppear{
            getData()
            
        }
        .blur(radius: appetizerVm.appetizerDetail == nil ? 0 : 10)
    }
    
    var body: some View {
        ZStack {
            AppetizerList()
            
            if (appetizerVm.networkProgress == .loading ) {
                LoadingOverlayView()
            }
            
            if appetizerVm.appetizerDetail != nil {
                AppetizerDetailView(
                    appreciater: appetizerVm.appetizerDetail!,
                    viewModel: appetizerVm
                )
            }
        }
    }
    
    func getData() {
        appetizerVm.getAppetizers()
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

