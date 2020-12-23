//
//  SwiftUICoreDataApp.swift
//  SwiftUICoreData
//
//  Created by 윤진영 on 2020/12/16.
//

import SwiftUI
import CoreData

@main
struct SwiftUICoreDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, CoreDataManager.shared.persistentContainer.viewContext)
                
        }
    }
    
}
