//
//  DateExtension.swift
//  GeekSocial
//
//  Created by George Gomes on 10/06/18.
//  Copyright © 2018 George Gomes. All rights reserved.
//

import Foundation

extension String{
    func toDate() ->Date {
        var result = Date()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        if let date = dateFormatter.date(from: self){
            result = date
        }
        
        return result
    }
}

extension Date{
    func isAdult() -> Bool{
        var result = false
        
        let dateOfBirth = self
        let today = Date()
        let gregorian = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
        
        let age = gregorian.components([.year], from: dateOfBirth, to: today, options: [])
        
        if age.year! >= 18 {
            result = true
        }
        
        return result
    }
    
    func toString() -> String{
        let formatter = DateFormatter()
        // initially set the format based on your datepicker date / server String
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let myString = formatter.string(from: self) // string purpose I add here
        // convert your string to date
        let yourDate = formatter.date(from: myString)
        //then again set the date format whhich type of output you need
        formatter.dateFormat = "dd/MM/yyyy"
        // again convert your date to string
        let myStringafd = formatter.string(from: yourDate!)
        
        return myStringafd
    }
    
    
    func shortDate() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: self)
    }

}

