//
//  ServiceRequest.swift
//  GeekSocial
//
//  Created by George Gomes on 17/03/18.
//  Copyright © 2018 George Gomes. All rights reserved.
//

import Foundation

enum RequestResponse <T>{
    case sucess(T)
    case error(Error)
}

protocol ServiceRequestProtocol {
    func login(_ nick: String,_ password: String, completion: @escaping (RequestResponse<User>) -> Void)
    func createAcc(_ user: User, completion: @escaping(RequestResponse<User>) -> Void)
}

class ServiceRequest: ServiceRequestProtocol{
    
    static let sharedInstance = ServiceRequest()

    
    func login(_ nick: String,_ password: String, completion: @escaping (RequestResponse<User>) -> Void){
        
    }
    
    func createAcc(_ user: User, completion: @escaping (RequestResponse<User>) -> Void) {
            }
    

}
