//
//  cellViewController.swift
//  EmployeeApi
//
//  Created by jacob n johar on 24/11/20.
//

import UIKit

class cellViewController: UIViewController{
  
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var company: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var suite: UILabel!
    @IBOutlet weak var address: UILabel!
    var street = " "
    var comp = " "
    var cell = " "
    var place = " "
    var apartment = " "
    override func viewDidLoad() {
        super.viewDidLoad()
        address.text = street
        suite.text = apartment
        city.text = place
        company.text = comp
        phone.text = cell
        // Do any additional setup after loading the view.
    }

}
