//
//  FIrebase.swift
//  GeekSocial
//
//  Created by George Gomes on 19/06/18.
//  Copyright © 2018 George Gomes. All rights reserved.
//

import Foundation
import Firebase

class FireBase{
    
    var ref: DatabaseReference!
    
    init(){
        
        self.ref = Database.database().reference()
    }
    
    
    
    
    
    
    
    
    
    func addReminder(reminder: Reminder){
        let userID = Auth.auth().currentUser?.uid
        self.ref.child("reminder").child(user.uid).setValue(["reminder": reminder.string])
    }
    
    
    
    
    
    
    
    func readReminders(completion: @escaping ([String], Error?) -> Void){
        let userID = Auth.auth().currentUser?.uid
        ref.child("reminder").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            let reminders = value?["username"] as? [String] ?? []
            completion(reminders, nil)
        }) { (error) in
            completion([],nil)
        }
    }
    
    
    
    
    
    func remove(reminder: String, completion: @escaping(Bool) -> Void) {
        
        let ref = self.ref.child(reminder)
        
        ref.removeValue { error, _ in
            if(err == nil){
                completion(true)
            }else{
                completion(false)
            }
        }
    }
    
    
    

    
    
    func updateReminder(reminder:String, Id:String){
        
        ref.child(id).setValue(reminder)
        
    }
    
    
    
    
    
    
    func addPost(userId: String, usernamse: String, title:String, body: String){
        let key = ref.child("posts").childByAutoId().key
        let post = ["uid": userID,
                    "author": username,
                    "title": title,
                    "body": body]
        let childUpdates = ["/posts/\(key)": post,
                            "/user-posts/\(userID)/\(key)/": post]
        ref.updateChildValues(childUpdates)
    }
    
    

}
