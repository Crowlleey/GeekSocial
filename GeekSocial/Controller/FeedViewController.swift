//
//  FeedViewController.swift
//  GeekSocial
//
//  Created by George Gomes on 17/03/18.
//  Copyright © 2018 George Gomes. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    var i = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(_ animated: Bool) {
      
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if(i == 0 ){
            i = i+1
            self.needsLogin()
        }
    }
    
    @IBAction func press(_ sender: Any) {
      
    }
    
    func needsLogin(){
        performSegue(withIdentifier: SegueTo.Login, sender: nil)
    }
    
    @IBAction func unwindSegue(_ sender: UIStoryboardSegue) {
        
    }
    
}
