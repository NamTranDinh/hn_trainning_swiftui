//
//  FrameWorkGridView.swift
//  MyApp
//
//  Created by Nam. Tran Dinh - CMC Global DKR1 on 11/2/25.
//

import SwiftUI

struct FrameWorkGridView: View {
    
    @StateObject var viewmodel = FrameWorkGridViewModel()
    
    let data = Framework.frameworks
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(data) { framework in
                        FrameWorkTitleView(framework: framework)
                            .onTapGesture {
                                viewmodel.selectedFramework = framework
                            }
                    }
                }
                .padding(.horizontal)
            }
            .navigationBarTitle(Text("🖥️ Apps"))
            .sheet(
                isPresented: $viewmodel.isShowingFrameworkDetail,
                content: {
                    FrameWorkDetailView(
                        framework: viewmodel.selectedFramework!,
                        isShowingSheet: $viewmodel.isShowingFrameworkDetail
                    )
                }
            )
        }
        
    }
    
    
}

struct FrameWorkGridView_Previews: PreviewProvider {
    static var previews: some View {
        FrameWorkGridView()
    }
}


struct FrameWorkTitleView : View {
    
    let framework : Framework
    
    var body: some View {
        VStack {
            Image(framework.imageName)
                .resizable()
                .renderingMode(.original)
                .frame(width: 90, height: 90)
            Text(framework.name)
                .font(.title3)
                .fontWeight(.semibold)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
        }
    }
}


struct FrameWorkDetailView : View {
    
    let framework : Framework
    @Binding var isShowingSheet: Bool
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Spacer()
                FrameWorkTitleView(framework: framework)
                Text(framework.description)
                    .padding()
                    .font(.body)
                Spacer()
                Link(
                    "Learn more",
                    destination: URL(string: framework.urlString)!
                ).font(.title3)
                
            }
            .navigationBarItems(
                leading: Image(systemName: "chevron.backward")
                    .onTapGesture {
                        isShowingSheet = false
                    }
            )
        }
        
    }
}

#Preview {
    FrameWorkDetailView(framework: Framework.frameworks[0], isShowingSheet: .constant(false))
}
