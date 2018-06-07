//
//  SignUpViewController.swift
//  GeekSocial
//
//  Created by George Gomes on 17/03/18.
//  Copyright © 2018 George Gomes. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    @IBAction func create(_ sender: Any) {
        
    }
    
    @IBAction func cancel(_ sender: Any) {
      print("chaa")
  
        backToLogin()
    }
    
    func backToLogin(){
        self.navigationController?.popViewController(animated: true)
    }
}


