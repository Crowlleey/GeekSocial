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
   
    func createAllert(with message: (error: String, describe: String), desmiss: Bool){
        
        let alert = UIAlertController(title: message.error, message: message.describe, preferredStyle: .alert)
        
        let ok = desmiss == false ? UIAlertAction(title: "ok", style: .default, handler: nil) : UIAlertAction(title: "ok", style: .default, handler: { _ in
            self.backToLogin()
        })
       
        alert.addAction(ok)
        
        present(alert, animated: true, completion: nil)
    }
    
    func backToLogin(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func create(_ sender: Any) {
        
        do {
            try userBO.check(self.tfNick.text, self.tfemail.text,
                                    birthDate: self.tfBirthdate.text?.toDate(), self.tfPassword.text, self.tfConfirmPassword.text)
            
            userBO.save(name: self.tfNick.text!, self.tfemail.text!, birthDate: self.tfBirthdate.text!.toDate(), self.tfPassword.text!, completion: { response in
                switch (response){
                    
                case .sucess(_):
                    self.createAllert(with: (error: "Sucesso", describe: "usuario criado com sucesso"), desmiss: true)
                    break
                    
                case .error(_):
                    break
                }
            })
        } catch {
            let message = userBO.errorDescriptor(error as! CheckRegisterError)
            createAllert(with: message, desmiss: false)
        }
    }
    
    @IBAction func cancel(_ sender: Any) {
        backToLogin()
    }
}




