//
//  ServiceRequest.swift
//  GeekSocial
//
//  Created by George Gomes on 17/03/18.
//  Copyright © 2018 George Gomes. All rights reserved.
//

import Foundation
import Alamofire

enum RequestResponse <T>{
    case sucess(T)
    case error(Error)
}

protocol ServiceRequestProtocol {
    func login(_ nick: String,_ password: String, completion: @escaping (RequestResponse<User>) -> Void)
    func createAcc(_ user: User, completion: @escaping(RequestResponse<User>) -> Void)
}

class ServiceRequest: ServiceRequestProtocol{
    
    private var localHost: String! // = "192.168.15.18:8080"
    private var urlServer: String! //= "http://\(self.localHost)/GeekSocial/ws/"
    private var post: String! // = "POST"
    private var headers: HTTPHeaders! //= ["application/x-www-form-urlencoded": "Content-Type"]

    static let sharedInstance = ServiceRequest()
    
    private init(){
        
        let http = "http://"
        let server = "/GeekSocial/ws/"
        
        self.localHost = "192.168.15.18:8080"
        self.urlServer = http + self.localHost + server 
        self.post = "POST"
        self.headers = ["application/x-www-form-urlencoded": "Content-Type"]
        
    }
    
    
    func login(_ nick: String,_ password: String, completion: @escaping (RequestResponse<User>) -> Void){
        
        var params = [String:String]()//= ["login": nick, "pass": password]
        params["login"] = nick
        params["pass"] = password
        
        let local = "LoginRest/login"
        let toSend = urlServer + local
        let urlToSend = URL(string: toSend)
        
        Alamofire.request(urlToSend!, method: .post, parameters: params, encoding: URLEncoding(), headers: headers).responseJSON  { response in
            
            switch response.result{
                
            case .success( _):
                if let _: Any = response.result.value{
                    if let _: Int = response.response?.statusCode {
                        //Got the status code and data. Do your data pursing task from here.
                        let backToString = String(data: response.data!, encoding: String.Encoding.utf8)
                        print(backToString!, "nnn")
                    }
                }else{
                     print("3")
                    //Response data is not valid, So do some other calculations here
                }
            case .failure(let fail):
                 print("4")
                 print(fail)
                break
                //Api request process failed. Check for errors here.
                }
        }
        
    }
  
    func createAcc(_ user: User, completion: @escaping (RequestResponse<User>) -> Void) {
        
        let local = "LoginRest/cadastrar"
        let toSend = urlServer + local
        let urlToSend = URL(string: toSend)
        let date = user.date.toString()
        print(date)
        
        let params = ["nome": user.name, "email": user.email, "pass": user.password, "data": date]
        
        Alamofire.request(urlToSend!, method: .post, parameters: params, encoding: URLEncoding(), headers: headers).response { response in
            let resp = response
            
            print(response.error)
            
        }
    }
}

extension Date{
    
    func shortDate() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: self)
    }
    
}
