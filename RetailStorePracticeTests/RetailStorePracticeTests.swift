//
//  RetailStorePracticeTests.swift
//  RetailStorePracticeTests
//
//  Created by Alok Kumar Naik on 02/03/2021.
//

import XCTest
@testable import RetailStorePractice

class RetailStorePracticeTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testFetchProducts(){
        let dataManager = ListDataManager()
        let interactor = ListInteractor(dataManager: dataManager)
        interactor.fetchProductsFromStore()
        let products = interactor.products.value
        
        XCTAssert(products.count > 0, "No products found")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
