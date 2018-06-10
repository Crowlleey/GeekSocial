//
//  User.swift
//  GeekSocial
//
//  Created by George Gomes on 16/03/18.
//  Copyright © 2018 George Gomes. All rights reserved.
//

import Foundation

protocol Certifiable {
    var name: String{get set}
    var email: String {get set}
    var password: String {get set}
}

class User: Certifiable {
    
    private var _name: String!
    private var _email: String!
    private var _password: String!
    private var _date: Date!
    
    
    init(_ name: String, _ email: String, _ password: String, _ date: Date) {
        self._name = name
        self._email = email
        self._password = password
        self._date = date
    }
    
    var name: String{
        get{
            return _name
        }
        set{
            _name = newValue
        }
    }
    
    var email: String {
        get{
            return _email
        }
        set{
            _email = newValue
        }
    }
    
    var password: String {
        get{
            return _password
        }
        set{
            _password = newValue
        }
    }
    
    var date: Date{
        get{
            return _date
        }
        set{
            _date = newValue
        }
    }
    
}



