//
//  UserBO.swift
//  GeekSocial
//
//  Created by George Gomes on 10/06/18.
//  Copyright © 2018 George Gomes. All rights reserved.
//

import Foundation

enum CheckRegisterError: Error{
    case invalidName
    case invalidEmail
    case invalidDate
    case invalidPassword
    case invalidConfirm
    case invalidSamePassword
}

class UserBO{
    
    
    func check(_ name: String?, _ email: String?, birthDate: Date?,_ password: String?,_ confirmPassword: String?) throws{
        
        if let name = name, let email = email, let birthDate = birthDate, let pass = password{
            if (name.count < 2){
                throw CheckRegisterError.invalidName
            }
            
            if(!email.contains("@")){
                throw CheckRegisterError.invalidEmail
            }
            
            if (!birthDate.isAdult()){
                throw CheckRegisterError.invalidDate
            }
            
            if (pass.count < 6){
                throw CheckRegisterError.invalidPassword
            }
            
        }
        guard let pass = password else { throw CheckRegisterError.invalidPassword }
        guard let confirm = confirmPassword else { throw CheckRegisterError.invalidConfirm }
        
        if (pass != confirm){
            throw CheckRegisterError.invalidSamePassword
        }
    }
    
    func save(name: String, _ email: String, birthDate: Date,_ password: String, completion: @escaping (RequestResponse<Bool>) -> Void){
        let user = User(name, email, password, birthDate)
        
        ServiceRequest.sharedInstance.createAcc(user) { response in
            switch (response){
                
            case .sucess(let boolean):
                completion(RequestResponse.sucess(boolean))
            case .error(let err):
                completion(RequestResponse.error(err))
            }
        }
    
    }
    
    func errorDescriptor(_ errorToDescribe: CheckRegisterError) -> (error: String, describe: String){
        
        var error: String!
        var describe: String!
        
        switch errorToDescribe {
        case .invalidName:
            error = "Nome Invalido"
            describe = "o nome precisa de no minimo duas letras"
        case .invalidEmail:
            error = "Email Invalido"
            describe = "o e mail precisa de um @"
        case .invalidDate:
            error = "Idade Invalida"
            describe = "o usuário precisa ter mais de 18 anos"
        case .invalidPassword:
            error = "Senha Invalida"
            describe = "a senha precisa ter 6 ou mais digitos"
        case .invalidConfirm:
            error = "as senhas não conferem"
            describe = ""
        case .invalidSamePassword:
            error = "Confirmação Invalida"
            describe = "as senhas não conferem"
        }
        
        return (error, describe)
    }
}
