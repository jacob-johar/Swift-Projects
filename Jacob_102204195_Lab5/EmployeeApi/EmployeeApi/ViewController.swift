//
//  ViewController.swift
//  EmployeeApi
//
//  Created by jacob n johar on 24/11/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var information:[Employee] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int{
    
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return information.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = self.information[indexPath.row].name
        cell?.detailTextLabel?.text = self.information[indexPath.row].email
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
    
        let viewController = storyboard?.instantiateViewController(withIdentifier: "cellViewController") as? cellViewController
        viewController?.street = self.information[indexPath.row].address.street
        viewController?.apartment = self.information[indexPath.row].address.suite
        viewController?.place = self.information[indexPath.row].address.city
        
        viewController?.comp = self.information[indexPath.row].company.name
        viewController?.cell = self.information[indexPath.row].phone
        
        self.navigationController?.pushViewController(viewController!, animated: true)
    }
    
    
    func fetchData(){
        let manager = JSONManager()
        manager.fetchJSONData { (datavalue) in
           
          DispatchQueue.main.async {
            self.information = datavalue
            self.tableView.reloadData()
            }
        }
        
    }

}

