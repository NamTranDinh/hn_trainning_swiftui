//
//  Framework.swift
//  MyApp
//
//  Created by Nam. Tran Dinh - CMC Global DKR1 on 11/2/25.
//

import Foundation


struct Framework: Hashable, Identifiable {
    var id: UUID
    let name: String
    let imageName: String
    let urlString: String
    let description: String
    
    static let frameworks: [Framework] = [
        Framework(id: UUID(),
                  name: "App Clips",
                  imageName: "ic_appstore",
                  urlString: "https://developer.apple.com/app-clips/",
                  description: "A small part of your app that lets users complete quick tasks without installing the full app."),
        
        Framework(id: UUID(),
                  name: "SwiftUI",
                  imageName: "ic_appstore",
                  urlString: "https://developer.apple.com/xcode/swiftui/",
                  description: "A modern way to declare user interfaces for any Apple platform."),
        
        Framework(id: UUID(),
                  name: "Combine",
                  imageName: "ic_appstore",
                  urlString: "https://developer.apple.com/documentation/combine",
                  description: "A framework for processing values over time using functional programming."),
        
        Framework(id: UUID(),
                  name: "Core Data",
                  imageName: "ic_appstore",
                  urlString: "https://developer.apple.com/documentation/coredata",
                  description: "A framework for managing the model layer objects in your application."),
        
        Framework(id: UUID(),
                  name: "ARKit",
                  imageName: "ic_appstore",
                  urlString: "https://developer.apple.com/arkit/",
                  description: "A framework for creating augmented reality experiences for iOS apps."),
        
        Framework(id: UUID(),
                  name: "Core Animation",
                  imageName: "ic_appstore",
                  urlString: "https://developer.apple.com/documentation/quartzcore/coreanimation",
                  description: "A powerful graphics rendering and animation framework."),
        
        Framework(id: UUID(),
                  name: "HealthKit",
                  imageName: "ic_appstore",
                  urlString: "https://developer.apple.com/documentation/healthkit",
                  description: "A framework for managing health and fitness data.")
    ]
}
