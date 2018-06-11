//
//  UserBOTest.swift
//  GeekSocialTests
//
//  Created by George Gomes on 10/06/18.
//  Copyright © 2018 George Gomes. All rights reserved.
//

import Foundation
import XCTest

@testable import GeekSocial

class UserBOTest:XCTestCase{
    
    let userBO = UserBO()
    
    func testThrowInName(){
        XCTAssertThrowsError(try userBO.check("o", "", birthDate: "12/01/1990".toDate(), "", ""))
    }
    
    func testThrowInEmail(){
        XCTAssertThrowsError(try userBO.check("George", " georgegmail", birthDate: "12/03/1997".toDate(), "aa", "aa"))
    }
    func testThrowInBirthDate(){
        XCTAssertThrowsError(try userBO.check("George", " george@gmail", birthDate: "12/03/2001".toDate(), "aa", "aa"))

    }
    func testThrowInPassword(){
        XCTAssertThrowsError(try userBO.check("George", " george@gmail", birthDate: "12/03/1997".toDate(), "aa", "123123"))

    }
    
    func testThrowInConfirmPass(){
         XCTAssertThrowsError(try userBO.check("George", " george@gmail", birthDate: "12/03/1997".toDate(), "123123", "123122"))
    }

    func testThrowWithOutPassord(){
        XCTAssertThrowsError(try userBO.check("George", " george@gmail", birthDate: "12/03/1997".toDate(), nil, nil))
    }
    
    func testThrowWithOutConfirmPassord(){
        XCTAssertThrowsError(try userBO.check("George", " george@gmail", birthDate: "12/03/1997".toDate(), "123123", nil))
    }
    
    func testPassAll(){
        XCTAssertNoThrow(try userBO.check("George", " george@gmail", birthDate: "12/03/1997".toDate(), "123123", "123123"))
    }
    
    
    // Test errorDescriptor
    func testErrorDescribName(){
        let invalidName = userBO.errorDescriptor(CheckRegisterError.invalidName)
        XCTAssertTrue(invalidName == (error:"Nome Invalido" ,describe:"o nome precisa de no minimo duas letras"))
        XCTAssertFalse(invalidName == (error:"Nome Invalidado" ,describe:"o nome precisa de no minimo duas letras"))
    }
    
    func testErrorDesccribEmail(){
        let invalidEmail = userBO.errorDescriptor(CheckRegisterError.invalidEmail)
        XCTAssertTrue(invalidEmail == (error: "Email Invalido",describe: "o e mail precisa de um @"))
    }
    
    func testErrorDescribeDate(){
        let invalidDate = userBO.errorDescriptor(CheckRegisterError.invalidDate)
        XCTAssertTrue(invalidDate == (error: "Idade Invalida", describe: "o usuário precisa ter mais de 18 anos"))
    }
    
    func testErrorDescribePassword(){
        let invalidPassword = userBO.errorDescriptor(CheckRegisterError.invalidPassword)
        XCTAssertTrue(invalidPassword == (error: "Senha Invalida", describe: "a senha precisa ter 6 ou mais digitos"))
    }
    
    func testErrorDescribeConfirm(){
        let invalidConfirmPass = userBO.errorDescriptor(CheckRegisterError.invalidConfirm)
        XCTAssertTrue(invalidConfirmPass == ( error: "as senhas não conferem", describe: "") )
    }
    
    func testErrorDescribeSamePassword(){
        let invalidSame = userBO.errorDescriptor(CheckRegisterError.invalidSamePassword)
        XCTAssertTrue(invalidSame == (error: "Confirmação Invalida", describe: "as senhas não conferem"))
    }
    
   
    
    
}
