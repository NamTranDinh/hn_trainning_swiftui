//
//  AppetizerDetailView.swift
//  MyApp
//
//  Created by NAM TRAN on 2/3/25.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    let appreciater: Appetizer
    let viewModel: AppetizersViewMModel
    
    private let widthCard: CGFloat = UIScreen.main.bounds.width * 0.85
    private let heightCard: CGFloat = UIScreen.main.bounds.height * 0.6
    
    var body: some View {
        
        VStack {
            AppetizerImage(url: appreciater.imageURL)
                .frame(width: widthCard, height: 225, alignment: .topLeading)
            Text(appreciater.name)
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
            
            Text(appreciater.description)
                .font(.subheadline)
                .padding(.horizontal, 16)
            
            Spacer()
                .frame(height: 34)
            
            HStack {
                VStack {
                    Text("Calories")
                        .font(.subheadline)
                    Text("\(appreciater.calories) g")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .fontWeight(.semibold)
                }
                VStack {
                    Text("Carbs")
                        .font(.subheadline)
                    Text("\(appreciater.carbs) g")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .fontWeight(.semibold)
                }
                .padding(.horizontal, 16)
                VStack {
                    Text("Protein")
                        .font(.subheadline)
                    Text("\(appreciater.protein) g")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .fontWeight(.semibold)
                }
            }
            Spacer()
            
            Button("$\(String(format: "%.2f", appreciater.price)) - Add To Order ") {
                print("Add item to card")
                viewModel.appetizerDetail = nil
            }
            .frame(width: widthCard * 0.9, height: 50)
            .font(.title3)
            .foregroundColor(.white)
            .background(Color("brandColor"))
            .fontWeight(.semibold)
            .cornerRadius(10)
            .padding()
            
            Spacer()
            
        }
        .frame(width: widthCard, height: heightCard)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(
            alignment: .topTrailing,
            content: {
                Button(
                    action: {
                        viewModel.appetizerDetail = nil
                    },
                    label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.gray)
                            .padding(10)
                    }
                )
                .frame(width: 36, height: 36)
                .background(.white.opacity(0.8))
                .cornerRadius(36)
                .padding(.all, 8)
            }
        )
        
    }
    
}

#Preview {
    AppetizerDetailView(
        appreciater: MockDataAppetizers.sampleAppetizers.first!,
        viewModel: AppetizersViewMModel.shared
    )
}
