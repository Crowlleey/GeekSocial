//
//  User.swift
//  GeekSocial
//
//  Created by George Gomes on 16/03/18.
//  Copyright © 2018 George Gomes. All rights reserved.
//

import Foundation

protocol Certifiable {
    var idUser: Int{get}
    var name: String{get set}
    var emaile: String {get set}
    var password: String {get set}
}

class User: Certifiable, Codable {

    private var idPessoa: Int?
    private var nome: String!
    private var email: String!
    private var senha: String!
    private var dataNasc: Date!
    
    init(_ name: String, _ email: String, _ password: String, _ date: Date) {
 
        self.nome = name
        self.email = email
        self.senha = password
        self.dataNasc = date
    }
    
    init(_ id: Int,_ name: String, _ email: String, _ password: String, _ date: Date) {
        
        self.idPessoa = id
        self.nome = name
        self.email = email
        self.senha = password
        self.dataNasc = date
    }
    
    init(){
        
    }
    
    func isEmpty() -> Bool{
        var check = false
        
        if((idPessoa == nil) && (nome == nil) && (email == nil) && (senha == nil) && (dataNasc == nil)){
            check = true
        }
        
        return check
    }
    
    var idUser: Int{
        get{
            guard let idDone = idPessoa else { return 0}
            return idDone
        }
    }
    
    var name: String{
        get{
            return nome
        }
        set{
            nome = newValue
        }
    }
    
    var emaile: String {
        get{
            return email
        }
        set{
            email = newValue
        }
    }
    
    var password: String {
        get{
            return senha
        }
        set{
            senha = newValue
        }
    }
    
    var date: Date{
        get{
            return dataNasc
        }
        set{
            dataNasc = newValue
        }
    }
    
}
