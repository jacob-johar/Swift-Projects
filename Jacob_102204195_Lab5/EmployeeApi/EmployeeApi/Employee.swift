//
//  Employee.swift
//  EmployeeApi
//
//  Created by jacob n johar on 24/11/20.
//


import Foundation
struct Employee: Codable{
    var id : Int
    var name: String
    var username : String
    var email : String
    var address : address
    var phone = String()
    var website = String()
    var company : company
    
}

struct address: Codable{
    var street : String
    var suite : String
    var city : String
    var zipcode = String()
    var geo : geo
    
}

struct geo: Codable{
  var lat = String()
    var lng = String()
    
}
struct company : Codable{
    var name = String()
    var catchPhrase = String()
    var bs = String()
}
