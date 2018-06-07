//
//  User.swift
//  GeekSocial
//
//  Created by George Gomes on 16/03/18.
//  Copyright © 2018 George Gomes. All rights reserved.
//

import Foundation

protocol Certifiable {
    var login: String {get}
    var password: String {get}
}

class User: Certifiable {
    var login: String{
        return "sdsa"
    }
    
    var password: String = ""
    
    
    
    
}



