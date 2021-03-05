//
//  AppDependencies.swift
//  RetailStorePractice
//
//  Created by Alok Kumar Naik on 03/03/2021.
//

import Foundation
import UIKit

class AppDependencies {
    
    func installRootViewControllerIntoWindow(_ window: UIWindow?) {
        let listWireframe = AppDependencies.configureListViewDependencies()
        listWireframe.presentListInterfaceFromWindow(window!)
    }
    
    class func configureListViewDependencies() -> ListWireframe {
        let listWireframe = ListWireframe()
        //let coreDataStore = CoreDataStore.sharedInstance
        let rootWireframe = RootWireframe()
        
        let listPresenter = ListPresenter()
        let listDataManager = ListDataManager()
        let listInteractor = ListInteractor(dataManager: listDataManager)
        
        listPresenter.listInteractor = listInteractor
        
        listWireframe.listPresenter = listPresenter
        listWireframe.rootWireframe = rootWireframe
        
        //listDataManager.coreDataStore = coreDataStore
        
        return listWireframe
    }
    
    deinit {
        print("AppDependencies Disposed")
    }
}
