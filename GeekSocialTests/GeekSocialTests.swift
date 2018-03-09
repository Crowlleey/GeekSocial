//
//  GeekSocialTests.swift
//  GeekSocialTests
//
//  Created by George Gomes on 07/03/18.
//  Copyright © 2018 George Gomes. All rights reserved.
//

import XCTest
@testable import GeekSocial

class GeekSocialTests: XCTestCase {
    
    var c: oi!
    
    override func setUp() {
        super.setUp()
        c = oi()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        c = nil
        
    }
    

    func testExample() {
        var i = c.sum(2, 2)
            XCTAssertTrue( i == 4)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
