//
//  StoreEntity+CoreDataProperties.swift
//  
//
//  Created by Alok Kumar Naik on 01/03/2021.
//
//

import Foundation
import CoreData


extension StoreEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StoreEntity> {
        return NSFetchRequest<StoreEntity>(entityName: "StoreEntity")
    }

    @NSManaged public var name: String?
    @NSManaged public var productId: UUID?
    @NSManaged public var categoryId: UUID?
    @NSManaged public var price: String?
    @NSManaged public var imageName: String?

}
