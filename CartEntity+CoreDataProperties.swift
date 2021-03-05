//
//  CartEntity+CoreDataProperties.swift
//  
//
//  Created by Alok Kumar Naik on 02/03/2021.
//
//

import Foundation
import CoreData


extension CartEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CartEntity> {
        return NSFetchRequest<CartEntity>(entityName: "CartEntity")
    }

    @NSManaged public var categoryId: Int16

}
