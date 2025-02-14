//
//  SplashView.swift
//  MyApp
//
//  Created by Nam. Tran Dinh - CMC Global DKR1 on 6/2/25.
//

import SwiftUI

typealias ContentData = (Int, String, String)



struct SplashView: View {
    var body: some View {
        splashBody()
    }
}

let tabs: [ContentData] =  [
    (1, "Documentation 1", "If you are new to Swift, you may want to check out these additional resources. 1"),
    (2, "Documentation 2", "If you are new to Swift, you may want to check out these additional resources. 2"),
    (3, "Documentation 3", "If you are new to Swift, you may want to check out these additional resources. 3"),
]


fileprivate func splashBody() -> some View {
    
    return ZStack {
        _buildBackground()
        TabView{
            ForEach(tabs, id: \.0) { data in
                _buildContent(title: data)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .ignoresSafeArea()
    }
}

fileprivate func _buildBackground() -> some View {
    return GeometryReader { geometry in
        Path(CGRect(
            x: 0,
            y: 0,
            width: UIScreen.screenWidth,
            height: UIScreen.screenHeight)
        ).fill(
            .linearGradient(
                Gradient(colors: [Color(43,63,121), Color(154, 55, 126)]),
                startPoint: UnitPoint(x: 0, y: 0),
                endPoint: UnitPoint(x: 1, y: 1)
            )
        )
        
        Path { path in
            path.move(to: CGPoint(x: 0, y: 300))
            path.addLine(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: UIScreen.screenWidth, y: 0))
            path.addLine(to: CGPoint(x: UIScreen.screenWidth, y: 100))
            path.addQuadCurve(
                to: CGPoint(x: 0, y: 300),
                control: CGPoint(x: 150, y: 150)
            )
        }
        .fill(Color(237, 75, 106))
        
        Path { path in
            path.addEllipse(in: CGRect(x: 50, y: 60, width: 70, height: 70))
        }.fill(.white)
        
        Path { path in
            path.move(to: CGPoint(x: 0, y: UIScreen.screenHeight - 100))
            path.addLine(to: CGPoint(x: 0, y: UIScreen.screenHeight))
            path.addLine(to: CGPoint(x: UIScreen.screenWidth, y: UIScreen.screenHeight))
            path.addLine(to: CGPoint(x: UIScreen.screenWidth, y: UIScreen.screenHeight - 300))
            path.addQuadCurve(
                to: CGPoint(x: 0, y: UIScreen.screenHeight - 100),
                control: CGPoint(x: UIScreen.screenWidth - 150, y: UIScreen.screenHeight - 150)
            )
        }
        .fill(Color(237, 75, 106))
        
        Path { path in
            path.addEllipse(in: CGRect(
                x: UIScreen.screenWidth - 120,
                y: UIScreen.screenHeight - 120,
                width: 70,
                height: 70
            ))
        }.fill(.white)
        
    }.ignoresSafeArea()
}

fileprivate func _buildContent(title: ContentData) -> some View {
    return VStack(alignment: HorizontalAlignment.leading){
        Text(title.1)
            .font(.system(size: 46))
            .foregroundColor(.white)
            .fontWeight(.bold)
            .padding(.bottom, 16)
        
        Text(title.2)
            .font(.system(size: 20))
            .foregroundColor(.white)
            .fontWeight(.medium)
        
        if tabs.last?.0 == title.0 {
            Button(
                action: {},
                label: {
                    Text("Get Started")
                        .fontWeight(.bold)
                }
            )
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)
        }
    }.padding(.horizontal, 16)
}

#Preview {
    SplashView()
}
