//
//  RootWireframe.swift
//  RetailStorePractice
//
//  Created by Alok Kumar Naik on 02/03/2021.
//

import Foundation
import UIKit

class RootWireframe: NSObject{
    
    func showRootViewController(_ viewController: UIViewController, inWindow: UIWindow){
        
        let navigationController = navigationControllerFromWindow(inWindow)
        navigationController.viewControllers = [viewController]
    }
    
    func navigationControllerFromWindow(_ window: UIWindow)->UINavigationController{
        let navigationController = window.rootViewController as! UINavigationController
        return navigationController
    }
}
