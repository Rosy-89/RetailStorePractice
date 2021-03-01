//
//  Constants.swift
//  RetailStorePractice
//
//  Created by Alok Kumar Naik on 01/03/2021.
//

import Foundation

enum Catgory: Int{
    
    case Electronics = 1, Furniture
    
    func title() -> String{
        
        switch self{
        
        case .Electronics:
            return "Electronics"
        default:
            return "Electronics"
        }
    }
}
