//
//  UmbrellaTests.swift
//  UmbrellaTests
//
//  Created by Carlos C. on 10/3/17.
//  Copyright © 2017 UmbrellaCorp. All rights reserved.
//

import XCTest
@testable import Umbrella

class UmbrellaTests: XCTestCase {

    
    func testNetworkCall() {
        let promise = expectation(description: "All Done")
        NetworkService.getForecast(for: "94040") { (weather, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(weather)
            promise.fulfill()
        }
        waitForExpectations(timeout: 10)
    }
    
}
