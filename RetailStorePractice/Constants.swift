//
//  Constants.swift
//  RetailStorePractice
//
//  Created by Alok Kumar Naik on 01/03/2021.
//

import Foundation

enum Category: Int{
    
    case Electronics = 1, Furniture
    
    func title() -> String{
        
        switch self{
        
        case .Electronics:
            return "Electronics"
        case .Furniture:
            return "Furniture"
        default:
            return "Electronics"
        }
    }
}

enum ScreenType{
    
    case List, Cart
    
    func title()-> String{
        
       switch self{
       
          case .List:
               return "Products"
          default:
               return "Cart"
    }
  }
}
