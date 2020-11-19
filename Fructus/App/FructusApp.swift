//
//  FructusApp.swift
//  Fructus
//
//  Created by 윤진영 on 2020/11/18.
//

import SwiftUI


@main
struct FructusApp: App {
    
    //AppStorage -> new dedicated property of wrapper for reading values from user defaults.
    //automatically invalidates the apps body property on a value change and refresh its UI immediately
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    var body: some Scene {
        WindowGroup {
            
            if isOnboarding{
                OnboardingView()
            }else{
                ContentView()
            }
            
        }
    }
}
