//
//  ViewController.swift
//  GeekSocial
//
//  Created by George Gomes on 07/03/18.
//  Copyright © 2018 George Gomes. All rights reserved.
//

import UIKit
import Foundation

class LoginViewController: UIViewController {

    var user: User!
    var userBO: UserBO!
    
    @IBOutlet weak var nickTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userBO = UserBO()
        
        //Gesture to dismiss keyboard
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    func createAllert(with message: (title: String, describe: String), dismiss: Bool){
        
        let alert = UIAlertController(title: message.title, message: message.describe, preferredStyle: .alert)
        
        let ok = dismiss == false ? UIAlertAction(title: "ok", style: .default, handler: nil) : UIAlertAction(title: "ok", style: .default, handler: { _ in
            self.performSegue(withIdentifier: "unwindToMain", sender: nil)
        })
        
        alert.addAction(ok)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func enter(_ sender: Any) {
        
        let login = nickTextField.text
        let pass = passwordTextField.text
        
        ServiceRequest.sharedInstance.login(login!, pass!) { requestResponse in
            switch requestResponse{
                case .sucess(let user):
                    self.userBO.saveUser(user: user , completion: { sucess in
                        switch sucess{
                            
                        case true:
                            self.createAllert(with: (title:"Logado" , describe: ""), dismiss: true)
                            break
                        case false:
                            self.createAllert(with: (title:"erro" , describe: ""), dismiss: false)
                            break
                        }
                    })
                    break
            case .error( _):
                    self.createAllert(with: (title:"erro1" , describe: ""), dismiss: false)
                    break
                case .fail:
                    self.createAllert(with: (title:"erro2" , describe: ""), dismiss: false)
            }
        }
    }
    
    @IBAction func signUp(_ sender: Any) {
        performSegue(withIdentifier: Segue.toSignUp.rawValue, sender: sender)
    }
    
    @IBAction func unwindSegue(_ sender: UIStoryboardSegue) {
        
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

