//
//  cellTableViewController.swift
//  TicketApp
//
//  Created by jacob n johar on 19/10/20.
//  Copyright © 2020 Jacob johar. All rights reserved.
//

import UIKit

class CellTableViewController: UIViewController{
    @IBOutlet weak var Item: UILabel!
    @IBOutlet weak var Quantity: UILabel!
    @IBOutlet weak var Total: UILabel!
    @IBOutlet weak var Date: UILabel!
    
    var  item = " "
    var quantity = " "
    var  price = " "
    var date = " "
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Item.text = item
        Quantity.text = quantity
        Total.text = price
        Date.text = date
       
    }
}
