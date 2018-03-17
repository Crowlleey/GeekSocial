//
//  FeedViewController.swift
//  GeekSocial
//
//  Created by George Gomes on 17/03/18.
//  Copyright © 2018 George Gomes. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    var reques = ServiceRequest()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
      
    }
    
    override func viewDidAppear(_ animated: Bool) {
        reques.login { (bul) in
            print(bul)
            if bul == true{
                self.needsLogin()
            }
        }
    }
    
    @IBAction func press(_ sender: Any) {
      
       
        
    }
    
    
    
    func needsLogin(){
        performSegue(withIdentifier: "toLogin", sender: nil)
    }
    
    @IBAction func unwindSegue(_ sender: UIStoryboardSegue) {
        
    }
    
}
