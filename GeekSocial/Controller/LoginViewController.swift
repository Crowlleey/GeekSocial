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

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
 
    @IBAction func enter(_ sender: Any) {
        performSegue(withIdentifier: "unwindToFeed", sender: self)
    }
    
    
    @IBAction func signUp(_ sender: Any) {
        performSegue(withIdentifier: "toSignUp", sender: sender)
    }
    
    @IBAction func unwindSegue(_ sender: UIStoryboardSegue) {
        
    }
    
    
}

