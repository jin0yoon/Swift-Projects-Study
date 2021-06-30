//
//  CoreDataImageTestApp.swift
//  CoreDataImageTest
//
//  Created by 윤진영 on 2021/06/26.
//

import SwiftUI

@main
struct CoreDataImageTestApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
