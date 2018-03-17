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
    }

    @IBAction func create(_ sender: Any) {
        backToLogin()
    }
    
    @IBAction func cancel(_ sender: Any) {
        backToLogin()
        
    }
    
    func backToLogin(){
        navigationController?.popViewController(animated: true)
    }
}
