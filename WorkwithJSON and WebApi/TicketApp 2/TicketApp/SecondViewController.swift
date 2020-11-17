//
//  SecondViewController.swift
//  TicketApp
//
//  Created by jacob n johar on 18/10/20.
//  Copyright © 2020 Jacob johar. All rights reserved.
//

import UIKit
class SecondViewController: UIViewController {
   
    @IBOutlet weak var history: UIButton!

  
    @IBOutlet weak var reset: UIButton!
    var tInformation:[Ticket] = [Ticket]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Manager Panel"
        history.backgroundColor = UIColor.red
        reset.backgroundColor = UIColor.red
    
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "ThirdSeque"{
            let otherVc = segue.destination as! TableViewController
            otherVc.info = tInformation
          
        }
        if segue.identifier == "ResetSeque"{
            let dVc = segue.destination as! ResetViewController
            dVc.infoData = tInformation
          
        }
    }
    
    
}

