//
//  CoreDataStore.swift
//  RetailStorePractice
//
//  Created by Alok Kumar Naik on 01/03/2021.
//

import Foundation
import UIKit
import CoreData
import RxSwift
import RxCocoa


class CoreDataStore : NSObject {

    static let sharedInstance = CoreDataStore()

    var persistentStoreCoordinator : NSPersistentStoreCoordinator!
    //A managed object model maintains a mapping between each of its entity objects
    //and a corresponding managed object class for use with the
    //persistent storage mechanisms in the Core Data framework.
    var managedObjectModel : NSManagedObjectModel!
    //instances of NSManagedObjectContext use a coordinator to store object graphs
    //in a persistant storage and retrieve model information
    var managedObjectContext : NSManagedObjectContext!

    //var cartItemsArray: Variable<[CartItem]> = Variable([])
    let cartItemsArray: BehaviorRelay<[CartItem]> = BehaviorRelay(value: [])

    override init() {

        managedObjectModel = NSManagedObjectModel.mergedModel(from: nil)

        persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)

        let domains = FileManager.SearchPathDomainMask.userDomainMask
        let directory = FileManager.SearchPathDirectory.documentDirectory

        let applicationDocumentsDirectory = FileManager.default.urls(for: directory, in: domains).first!
        let options = [NSMigratePersistentStoresAutomaticallyOption : true, NSInferMappingModelAutomaticallyOption : true]

        let storeURL = applicationDocumentsDirectory.appendingPathComponent("RetailStore.sqlite")

        try! persistentStoreCoordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: options)

        managedObjectContext = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = persistentStoreCoordinator
        managedObjectContext.undoManager = nil

        super.init()
    }

    func fetchCartItems(_ completionBlock: (([CartItem]) -> Void)!) {
        self.fetchEntriesWithPredicate({ entries in
            completionBlock(entries)
        })
    }
    func fetchEntriesWithPredicate(_ completionBlock: (([CartItem]) -> Void)!) {

        let fetchRequest: NSFetchRequest<NSFetchRequestResult>  = NSFetchRequest(entityName: "CartItem")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "productId", ascending: true)]
        fetchRequest.returnsObjectsAsFaults = false
        managedObjectContext.perform {
            let queryResults = try? self.managedObjectContext.fetch(fetchRequest)
            let managedResults = queryResults! as! [CartItem]

            self.cartItemsArray.accept(managedResults)
            //self.cartItemsArray.value = managedResults
            completionBlock(managedResults)
        }
    }

    //MARK: Database Operations
    func save() {
        do {
            try managedObjectContext.save()
        } catch let error {
            print("error: \(error)")
        }
    }

    func deleteObject(cartItem: CartItem) {
        managedObjectContext.delete(cartItem)
    }

    func discardMOCChanges() {
        managedObjectContext.rollback()
    }

    //MARK: Utility Methods
    func newCartItem() -> CartItem {
        let entity = CartItem(context: managedObjectContext)
        return entity

    }

    func checkForSimilarCartItemAndDelete(cartItemToCheck: CartItem) {
        for cartItem in self.cartItemsArray.value {
            if cartItem.productId == cartItemToCheck.productId && cartItemToCheck != cartItem {
                deleteObject(cartItem: cartItem)
            }
        }
    }

    func deleteCartItem(withProductId productId: Int16) {
        for cartItem in self.cartItemsArray.value {
            if cartItem.productId == productId {
                deleteObject(cartItem: cartItem)
                save()
                break;
            }
        }
    }

}
