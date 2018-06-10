//
//  GeekSocialUITests.swift
//  GeekSocialUITests
//
//  Created by George Gomes on 07/03/18.
//  Copyright © 2018 George Gomes. All rights reserved.
//

import XCTest

class GeekSocialUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let app = XCUIApplication()
        
        
        let appp = app
        let signupButton = appp.buttons["SignUP"]
        signupButton.tap()
        
      
        app.buttons["Cancel"].tap()
        signupButton.tap()
        
        let createButton = app.buttons["Create"]
        createButton.tap()
        app.alerts["Nome Invalido"].buttons["ok"].tap()
        app.textFields["nick"].tap()
        
        let gKey = appp/*@START_MENU_TOKEN@*/.keys["g"]/*[[".keyboards.keys[\"g\"]",".keys[\"g\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        gKey.tap()
        gKey.tap()
        gKey.tap()
        gKey.tap()
        gKey.tap()
        gKey.tap()
        
        let element2 = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        let element = element2.children(matching: .other).element
        element.tap()
        createButton.tap()
        app.alerts["Email Invalido"].buttons["ok"].tap()
        app.textFields["e-mail"].tap()
        gKey.tap()
        gKey.tap()
        
        let key = appp/*@START_MENU_TOKEN@*/.keys["@"]/*[[".keyboards.keys[\"@\"]",".keys[\"@\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key.tap()
        key.tap()
        
        let dataDeNascimentoTextField = app.textFields["data de nascimento"]
        dataDeNascimentoTextField.tap()
        element.tap()
        createButton.tap()
        app.alerts["Idade Invalida"].buttons["ok"].tap()
        dataDeNascimentoTextField.tap()
        
        let key2 = appp/*@START_MENU_TOKEN@*/.keys["0"]/*[[".keyboards.keys[\"0\"]",".keys[\"0\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key2.tap()
        key2.tap()
        
        let key3 = appp/*@START_MENU_TOKEN@*/.keys["1"]/*[[".keyboards.keys[\"1\"]",".keys[\"1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key3.tap()
        key3.tap()
        
        let key4 = appp/*@START_MENU_TOKEN@*/.keys["/"]/*[[".keyboards.keys[\"\/\"]",".keys[\"\/\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key4.tap()
        key4.tap()
        key3.tap()
        appp/*@START_MENU_TOKEN@*/.keys["2"]/*[[".keyboards.keys[\"2\"]",".keys[\"2\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        key4.tap()
        key4.tap()
        key3.tap()
        key3.tap()
        
        let key5 = appp/*@START_MENU_TOKEN@*/.keys["9"]/*[[".keyboards.keys[\"9\"]",".keys[\"9\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key5.tap()
        key5.tap()
        key5.tap()
        appp/*@START_MENU_TOKEN@*/.keys["4"]/*[[".keyboards.keys[\"4\"]",".keys[\"4\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        element.tap()
        
        let passwordTextField = app.textFields["password"]
        passwordTextField.tap()
        element.tap()
        createButton.tap()
        app.alerts["Senha Invalida"].buttons["ok"].tap()
        passwordTextField.tap()
        
        let aKey = appp/*@START_MENU_TOKEN@*/.keys["a"]/*[[".keyboards.keys[\"a\"]",".keys[\"a\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        aKey.tap()
        aKey.tap()
        aKey.tap()
        aKey.tap()
        aKey.tap()
        aKey.tap()
        aKey.tap()
        aKey.tap()
        element.tap()
        createButton.tap()
        app.alerts["Confirmação Invalida"].buttons["ok"].tap()
        app.textFields["confirm password"].tap()
        aKey.tap()
        aKey.tap()
        aKey.tap()
        aKey.tap()
        aKey.tap()
        aKey.tap()
        element.tap()
        createButton.tap()
        app.alerts["Sucesso"].buttons["ok"].tap()
        app.textFields["user"].tap()
        gKey.tap()
        
        let eKey = appp/*@START_MENU_TOKEN@*/.keys["e"]/*[[".keyboards.keys[\"e\"]",".keys[\"e\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        eKey.tap()
        
        let oKey = appp/*@START_MENU_TOKEN@*/.keys["o"]/*[[".keyboards.keys[\"o\"]",".keys[\"o\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        oKey.tap()
        
        let rKey = appp/*@START_MENU_TOKEN@*/.keys["r"]/*[[".keyboards.keys[\"r\"]",".keys[\"r\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        rKey.tap()
        gKey.tap()
        eKey.tap()
        element2.tap()
        
        let enterButton = app.buttons["Enter"]
        enterButton.tap()
        app.alerts["erro2"].buttons["ok"].tap()
        app.secureTextFields["password"].tap()
        gKey.tap()
        eKey.tap()
        oKey.tap()
        rKey.tap()
        gKey.tap()
        eKey.tap()
        element2.tap()
        enterButton.tap()
        app.alerts["Logado"].buttons["ok"].tap()
     
        
       
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}
