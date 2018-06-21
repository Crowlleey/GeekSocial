//
//  ServiceRequestTest.swift
//  GeekSocialTests
//
//  Created by George Gomes on 12/06/18.
//  Copyright © 2018 George Gomes. All rights reserved.
//

import Foundation
import XCTest

@testable import GeekSocial

class ServiceRequestTest:XCTestCase{
    
    func testLogin(){
        ServiceRequest.sharedInstance.login("george", "george") { respo in
            switch(respo){
                
            case .sucess(let i):
                XCTAssertTrue(i.name == "george")
            case .error(let err):
                XCTAssertFalse(err == nil)
            case .fail:
                break
                
            }
        }
    }
    
    func testCreate(){
        let user = User("paulo", "paulo", "paulo", "21/02/1992".toDate())
        
        ServiceRequest.sharedInstance.createAcc(user) { respo in
            switch(respo){
                
            case .sucess(let i):
                XCTAssertTrue(i)
            case .error(let err):
                XCTAssertFalse(err == nil)
            case .fail:
                break
            
            }
        }
    }
    
}
