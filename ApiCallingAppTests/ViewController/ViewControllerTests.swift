//
//  ViewControllerTests.swift
//  ApiCallingAppTests
//
//  Created by Mukesh Pawar on 28/06/22.
//


import XCTest
@testable import ApiCallingApp
 
class ViewControllerTests: XCTestCase {

    override func setUpWithError() throws {

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func makeSUT() -> ViewController {
         let storyboard = UIStoryboard(name: "Main", bundle: nil)
         let sut = storyboard.instantiateViewController(identifier: "ViewController") as! ViewController
         sut.viewDidLoad()
         return sut
     }

 
}
