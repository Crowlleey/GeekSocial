//
//  SignUpViewController.swift
//  GeekSocial
//
//  Created by George Gomes on 17/03/18.
//  Copyright © 2018 George Gomes. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    
    @IBOutlet weak var tfNick: UITextField!
    @IBOutlet weak var tfemail: UITextField!
    @IBOutlet weak var tfBirthdate: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfConfirmPassword: UITextField!
    
    var userBO: UserBO!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.userBO = UserBO()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    @IBAction func create(_ sender: Any) {
        
        do {
            try userBO.check(self.tfNick.text, self.tfemail.text,
                                    birthDate: self.tfBirthdate.text?.toDate(), self.tfPassword.text, self.tfConfirmPassword.text)
            
            userBO.save(name: self.tfNick.text!, self.tfemail.text!, birthDate: self.tfBirthdate.text!.toDate(), self.tfPassword.text!)
            
        } catch {
            
            let message = userBO.errorDescriptor(error as! CheckRegisterError)
            
            let alert = UIAlertController(title: message.error, message: message.describe, preferredStyle: .alert)
            let ok = UIAlertAction(title: "ok", style: .default, handler: nil)
            alert.addAction(ok)
            
            present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func cancel(_ sender: Any) {

  
        backToLogin()
    }
    
    func backToLogin(){
        self.navigationController?.popViewController(animated: true)
    }
}




