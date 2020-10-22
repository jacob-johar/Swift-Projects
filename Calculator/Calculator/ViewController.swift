//
//  ViewController.swift
//  Calculator
//
//  Created by jacob n johar on 27/09/20.
//  Copyright © 2020 Jacob johar. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource{
   
    
    @IBOutlet weak var tableView: UITableView!
    
   
    var stack = calculatorBrain()
        
    @IBOutlet weak var Display: UILabel!
    var result = Double()
    var currentNumber = Double()
    var valueOne = Double()
    var valueTwo = Double()
    var currentOp = String()
    var compute = String()
    var value: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        currentOp = "-"
        Display.text = ("\(result)")
    }

    @IBAction func digit_Pressed(_ sender: UIButton) {
        currentNumber = currentNumber * 10 + Double(Int(sender.titleLabel?.text ?? "") ?? 0)
         Display.text = ("\(currentNumber)")
    }
    
    @IBAction func enter_Pressed(_ sender: UIButton) {
        stack.pushItem(currentNumber)
        currentNumber = 0
        Display.text = ("\(currentNumber)")
    }
    @IBAction func operator_Pressed(_ sender: UIButton)
    {
        currentOp = String(sender.currentTitle!)
        valueOne = stack.popItem()!
        valueTwo = stack.popItem()!
        
        if(currentOp == "+")
        {
            currentNumber = valueOne + valueTwo
        }
        
        else if(currentOp == "-")
        {
            currentNumber = valueTwo - valueOne
        }
        else if(currentOp == "*")
        {
            currentNumber = valueOne * valueTwo
        }
        else if(currentOp == "/")
        {
            currentNumber = valueTwo / valueOne
        }
       else
        {
            print("error")
        }
        
        result = currentNumber
        
        compute = String(valueTwo) + " " + currentOp + " " + String(valueOne) + " " + "=" + " " + String(result)
        value.append(compute)
        currentNumber = currentNumber  + Double(Int(sender.titleLabel?.text ?? "") ?? 0)
        Display.text = ("\(result)")
        currentOp = sender.titleLabel!.text! as String
        tableView.reloadData()
    }
    @IBAction func clear_Pressed(_ sender: UIButton)
    {
        
        result = 0
        currentNumber = 0
        currentOp = "-"
        Display.text = ("\(result)")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return value.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        print(value)
        cell?.textLabel?.text = self.value[indexPath.row]
        return cell!
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int{
    
        return 1
    }
 
}


