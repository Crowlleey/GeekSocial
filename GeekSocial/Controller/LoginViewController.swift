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
    
    @IBOutlet weak var nickTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Gesture to dismiss keyboard
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    @IBAction func enter(_ sender: Any) {
        
        let login = nickTextField.text
        let pass = passwordTextField.text
        
        ServiceRequest.sharedInstance.login(login!, pass!) { requestResponse in
            switch requestResponse{
                case .sucess(let opa):
                    print(opa)
                    break
                
                case .error(let err):
                    print(err)
                    break
            }
        }
        
        
        let alertd = UIAlertController(title: "Senha errada", message: "Voce colocou a senha errada", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertd.addAction(OKAction)
        self.present(alertd, animated: true, completion: nil)
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

