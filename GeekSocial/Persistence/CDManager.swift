//
//  CDManager.swift
//  GeekSocial
//
//  Created by George Gomes on 10/06/18.
//  Copyright © 2018 George Gomes. All rights reserved.
//

import CoreData
import UIKit

enum ManagedType: String {
    case user = "UserCD"
}

enum RequestType: String{
    case name = "name"
}

private let cDInstance = CDManager()

protocol CDManagerProtocol{
    func saveThis<T: NSManagedObject>(_ obj: T, completionHandler: @escaping(Error?) -> Void)
}

class CDManager: CDManagerProtocol{
    
    public class func managerInstance() -> CDManager{
        return cDInstance
    }
    
    func saveThis<T: NSManagedObject>(_ obj: T, completionHandler: @escaping(Error?) -> Void){
        
        let context = getContext()
        
        do {
            try context.save()
            
            completionHandler(nil)
        } catch let err {
            print("Fatal ERROR")
            completionHandler(err)
        }
    }
    
    func deleteThis<T>(_ obj: T, completionHandler: @escaping(Error) -> Void){
        
    }
    
    func fetchAll<T>(_ objectType: T, completionHandler: @escaping([T], Error?) -> Void) where T:NSManagedObject {
        let context = getContext()
        
        var fetchedResult: NSFetchedResultsController<T>!
        let fetchRequest: NSFetchRequest<T> = T.fetchRequest() as! NSFetchRequest<T> //Person.fetchRequest()
        fetchRequest.returnsObjectsAsFaults = false
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        fetchedResult = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResult.delegate = UIViewController() as? NSFetchedResultsControllerDelegate
        
        do {
            try fetchedResult.performFetch()
            completionHandler(fetchedResult.fetchedObjects ?? [], nil)
        } catch let err {
            print(err)
            completionHandler([],err)
        }
    }
    
//    func checkLogin()-> Bool{
//        
//    }
    
    func getContext() -> NSManagedObjectContext{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func Object<T>() -> T where T: NSManagedObject{
        return T(context: getContext())
    }
}


