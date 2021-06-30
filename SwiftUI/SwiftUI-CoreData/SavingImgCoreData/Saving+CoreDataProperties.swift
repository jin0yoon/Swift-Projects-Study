//
//  Saving+CoreDataProperties.swift
//  SavingImgCoreData
//
//  Created by 윤진영 on 2021/06/26.
//
//

import Foundation
import CoreData


extension Saving {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Saving> {
        return NSFetchRequest<Saving>(entityName: "Saving")
    }

    @NSManaged public var descriptions: String?
    @NSManaged public var favo: Bool
    @NSManaged public var imageD: Data?
    @NSManaged public var username: String?

}

extension Saving : Identifiable {

}
