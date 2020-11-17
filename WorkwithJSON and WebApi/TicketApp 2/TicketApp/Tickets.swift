//
//  Tickets.swift
//  TicketApp
//
//  Created by jacob n johar on 17/11/20.
//  Copyright © 2020 Jacob johar. All rights reserved.
//

import Foundation
struct Value: Codable{
    var type : String
    var price : Int
    var quantity : Int
    
}
struct Tickets : Codable{
    var data = [Value]()
}
