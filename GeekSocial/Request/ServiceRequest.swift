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
    case fail
}

protocol ServiceRequestProtocol {
    func login(_ nick: String,_ password: String, completion: @escaping (RequestResponse<User>) -> Void)
    func createAcc(_ user: User, completion: @escaping(RequestResponse<Bool>) -> Void)
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
        
        self.localHost = "192.168.25.5:8080"
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
                        
                        if let data = response.data{
                            do{
                                print("com data")
                                let decoder = JSONDecoder()
                                decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
                                let users = try decoder.decode([User].self, from: data)
                                
                                if(users.count != 0){
                                    completion(RequestResponse.sucess(users[0]))
                                }else{
                                    completion(RequestResponse.fail)
                                }
                            }catch{
                                completion(RequestResponse.error(error))
                            }
                        }else{
                            completion(RequestResponse.fail)
                        }
                    }
                }else{
                 completion(RequestResponse.fail)
                }
            case .failure(let fail):
                 completion(RequestResponse.error(fail))
                break
             
            }
        }
    }

    func createAcc(_ user: User, completion: @escaping (RequestResponse<Bool>) -> Void) {
        
        let local = "LoginRest/cadastrar"
        let toSend = urlServer + local
        let urlToSend = URL(string: toSend)
        let date = user.date.toString()
        print(date)
        
        let params = ["nome": user.name, "email": user.emaile, "pass": user.password, "data": date]
        
        Alamofire.request(urlToSend!, method: .post, parameters: params, encoding: URLEncoding(), headers: headers).response { response in
    
            if (response.error != nil){
                completion(RequestResponse.error(response.error!))
            }else{
                completion(RequestResponse.sucess(true))
            }
        }
    }
}

extension DateFormatter {
    static let iso8601Full: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
}

