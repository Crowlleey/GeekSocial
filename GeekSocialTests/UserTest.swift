//
//  UserTest.swift
//  GeekSocialTests
//
//  Created by George Gomes on 10/06/18.
//  Copyright © 2018 George Gomes. All rights reserved.
//

import Foundation
import XCTest

@testable import GeekSocial

class UserTest:XCTestCase{
    
    func testIsEmpty(){
        let userA = User("George", "georgegomees@gmail.com", "123123", "01/12/1994".toDate())
        
        // user with date string
        let userB = User(01, "George", "georgegomees@gmail.com", "123123", "01/12/1994".toDate())

        XCTAssertFalse(userA.isEmpty())
        XCTAssertFalse(userB.isEmpty())

    }
    
    func testIsNotEmpty(){
        let user = User()
        XCTAssertTrue(user.isEmpty())
    }
    
    func testGetID(){
        let userA = User("George", "georgegomees@gmail.com", "123123", "01/12/1994".toDate())
        let userB = User(01, "George", "georgegomees@gmail.com", "123123", "01/12/1994".toDate())

        print(userB.idUser)
        XCTAssertTrue(userB.idUser == 1)
        XCTAssertTrue(userA.idUser == 0)
    }
    
    func testGetSetAttributes(){
        let userA = User("George", "george@gmail.com", "123123", "01/12/1994".toDate())
        let userB = User(01, "George", "george@gmail.com", "123123", "01/12/1994".toDate())

        //Name
        
        userA.name = "Pedro"
        
        XCTAssertTrue(userA.name == "Pedro")
        XCTAssertFalse(userA.name == "George")
        
        userB.name = "George"
        XCTAssertTrue(userB.name == "George")
        XCTAssertFalse(userB.name == "Pedro")
        
        //Email
        
        userA.emaile = "pedro@gmail.com"
        XCTAssertTrue(userA.emaile == "pedro@gmail.com")
        XCTAssertFalse(userA.emaile == "george@gmail.com")
        
        userB.emaile = "george@hotmail.com"
        XCTAssertTrue(userB.emaile == "george@hotmail.com")
        XCTAssertFalse(userB.emaile == "george@gmail.com")
        
        //Password
        
        userA.password = "123123"
        XCTAssertTrue(userA.password == "123123")
        XCTAssertFalse(userA.password == "321321")
        
        userB.password = "321321"
        XCTAssertTrue(userB.password == "321321")
        XCTAssertFalse(userB.password == "123123")
        
        userA.date = "10/01/1992".toDate()
        XCTAssertTrue(userA.date == "10/01/1992".toDate())
        XCTAssertFalse(userA.date == "10/01/1991".toDate())
    }
    
}
