//
//  DetailPresenter.swift
//  RetailStorePractice
//
//  Created by Juan carlos De la parra on 04/03/21.
//


import Foundation
import UIKit
import RxSwift

class DetailPresenter {
    var detailInteractor : DetailInteractor?
    var detailWireframe : DetailWireframe?
    var userInterface : DetailViewController?
    var disposeBag: DisposeBag = DisposeBag()
    
    
    func add(toCart productId: NSNumber) {
        detailInteractor?.save(toCart: productId.int16Value, withCompletionBlock: { saved in
            if saved {
                self.detailWireframe?.displayAlert(title: "Added", message: "Product added to the Cart")
                self.userInterface?.updateCartCount()
            }
            else {
                self.detailWireframe?.displayAlert()
            }
        })
    }
    
}

