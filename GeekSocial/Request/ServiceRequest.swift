//
//  ServiceRequest.swift
//  GeekSocial
//
//  Created by George Gomes on 17/03/18.
//  Copyright © 2018 George Gomes. All rights reserved.
//

import Foundation

class ServiceRequest{
    var change = true
    func login(completionHandler: @escaping(Bool)-> Void){
        
        completionHandler(change)
        change = false
        
    }
}
