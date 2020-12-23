//
//  CoreDataManager.swift
//  SwiftUICoreData
//
//  Created by 윤진영 on 2020/12/20.
//

import CoreData

class CoreDataManager {
    
    //MARK: - PROPERTIES
    static let shared = CoreDataManager()
    
    private init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "books")
        
        container.loadPersistentStores { (storeDesc, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        
        return container
    }()
    
    //MARK: - saveContext -> used in addData, updateData, deleteData
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do{
                try context.save()
            }catch{
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}

