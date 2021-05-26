//
//  AppleSwiftUITutorialApp.swift
//  AppleSwiftUITutorial
//
//  Created by 윤진영 on 2021/05/23.
//

/*
 An app that uses the SwiftUI app life cycle has a structure that conforms to the App protocol.
 The structure's body property returns one or more scenes, which in turn provide content for display.
 The @main attribute identifies the app's entry point.
 */

import SwiftUI

@main
struct AppleSwiftUITutorialApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
