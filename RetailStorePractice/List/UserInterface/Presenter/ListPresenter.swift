//
//  ListPresenter.swift
//  RetailStorePractice
//
//  Created by Juan carlos De la parra on 01/03/21.
//

import Foundation
import UIKit
import RxSwift
import RxDataSources

class ListPresenter {
    var listWireframe : ListWireframe?
    var listInteractor : ListInteractor?
    var userInterface : ListViewController?
    let disposeBag = DisposeBag()
    
    func updateUserInterface(with cartItems: [CartItem]) {
        userInterface?.updatedCartItems(cartItems)
    }
    
    func updateUserInterface(withCartSectionedProducts sectionedProducts: [SectionModel<NSNumber, Product>]) {
        userInterface?.showProducts(sectioned: sectionedProducts)
    }
    
    func updateUserInterface(withSectionedProducts sectionedProducts: [SectionModel<NSNumber, Product>]) {
        userInterface?.showProducts(sectioned: sectionedProducts)
    }
    
    func updateView(screenType: ScreenType) {
        //Cart Items
        listInteractor?.fetchProductsFromStore()
        listInteractor?.products
            .asObservable().subscribe( {onNext in
                guard let cartItems = self.listInteractor?.cartItems else {
                    return
                }
               
                if let filteredProducts = self.listInteractor?.cartItemProducts(cartItems: cartItems.value) {
                    if let sectioned = self.listInteractor?.sectionedData(data: filteredProducts) {
                        if (screenType == .Cart) {
                            self.updateUserInterface(withSectionedProducts: sectioned)
                        }
                    }
                }
            })
            .disposed(by:disposeBag)

        //Products
        listInteractor?.fetchProductsFromStore()
        listInteractor?.products
        .asObservable().subscribe( {onNext in
            guard let products = self.listInteractor?.products else {
                return
            }
            if let sectioned = self.listInteractor?.sectionedData(data: products.value) {
                if (screenType == .List) {
                    self.updateUserInterface(withSectionedProducts: sectioned)
                }
            }
        })
            .disposed(by:disposeBag)
    }
    
    
    func showDetail(product: Product) {
        listWireframe?.navigateToDetail(withProduct: product)
    }
    
    func deleteCartItem(withProductId productId: Int16) {
        listInteractor?.deleteCartItem(withProductId: productId)
    }
    

}

