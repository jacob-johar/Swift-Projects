//
//  TableViewController.swift
//  TicketApp
//
//  Created by jacob n johar on 19/10/20.
//  Copyright © 2020 Jacob johar. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
   
       
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
             super.viewDidLoad()
           tableView.delegate = self
           tableView.dataSource = self
            
         }
    
     var info:[Ticket] = [Ticket]()
          
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           
           return info.count;
       }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = self.info[indexPath.row].type
        cell?.detailTextLabel?.text = String(self.info[indexPath.row].quantity)
        return cell!
        
    }
       func numberOfSections(in tableView: UITableView) -> Int{
       
           return 1
       }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = storyboard?.instantiateViewController(withIdentifier: "CellTableViewController") as? CellTableViewController
        viewController?.item = self.info[indexPath.row].type
        viewController?.quantity = String(self.info[indexPath.row].quantity)
        viewController?.price = String(self.info[indexPath.row].price)
        viewController?.date = String(self.info[indexPath.row].date)
        self.navigationController?.pushViewController(viewController!, animated: true)  
    }
}
