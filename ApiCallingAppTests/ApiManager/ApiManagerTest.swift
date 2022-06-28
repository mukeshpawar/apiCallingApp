//
//  ApiManagerTestCase.swift
//  ApiCallingAppTests
//
//  Created by Mukesh Pawar on 24/06/22.
//

import XCTest

class ApiManagerTest: XCTestCase {
        
        var sut = URLSession.shared

        override func setUpWithError() throws {
            try super.setUpWithError()
            sut = type(of: URLSession.shared).init(configuration: .default)
        }

        override func tearDownWithError() throws {
         
            try super.tearDownWithError()
            
        }
        
        func testApiCallCompletes() throws {
          // given
          let urlString = "https://dummy.restapiexample.com/api/v1/employees"
          let url = URL(string: urlString)!
          let promise = expectation(description: "Completion handler invoked")
          var statusCode: Int?
          var responseError: Error?

          // when
            let dataTask = sut.dataTask(with: url) { _, response, error in
            statusCode = (response as? HTTPURLResponse)?.statusCode
            responseError = error
            promise.fulfill()
          }
          dataTask.resume()
          wait(for: [promise], timeout: 5)

          // then
          XCTAssertNil(responseError)
          XCTAssertEqual(statusCode, 429)
        }


        // Asynchronous test: success fast, failure slow
        func testValidApiCallGetsHTTPStatusCode200() throws {
          // given
          let urlString =
            "http://www.randomnumberapi.com/api/v1.0/random?min=0&max=100&count=1"
          let url = URL(string: urlString)!
          // 1
          let promise = expectation(description: "Status code: 200")

          // when
          let dataTask = sut.dataTask(with: url) { _, response, error in
            // then
            if let error = error {
              XCTFail("Error: \(error.localizedDescription)")
              return
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
              if statusCode == 200 {
                // 2
                promise.fulfill()
              } else {
                XCTFail("Status code: \(statusCode)")
              }
            }
          }
          dataTask.resume()
          // 3
          wait(for: [promise], timeout: 5)
        }

    }
