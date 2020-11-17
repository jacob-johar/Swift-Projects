//
//  ViewController.swift
//  TicketApp
//
//  Created by jacob n johar on 16/10/20.
//  Copyright © 2020 Jacob johar. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
   
    var ticket = Ticket()
    
    @IBOutlet weak var Quantity: UILabel!
    @IBOutlet weak var Price: UILabel!
    @IBOutlet weak var ticketType: UILabel!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var manager: UIButton!
    var currentNumber = 0
    var result = 0
    var data = [" "]
    var bData = " "
    var lData = " "
    var cData = " "
    var rowNo = [0]

       var information:[Ticket] = [Ticket]()

    override func viewDidLoad() {
        super.viewDidLoad()
        Quantity.text = " "
        ticketType.text = " "
        Price.text = "0"
        picker.dataSource = self
        picker.delegate = self
        manager.backgroundColor = UIColor.red
     
        fetchData()
      

       
    }
    
   
 
    //Function to update the values in picker
    func valueUpdate(bValue: Int,lValue: Int, cValue: Int, bPrice: Int,lPrice: Int, cPrice: Int, bType: String, lType: String, cType: String) {
            data.removeAll()
        if(bValue > 0){
            bData = bType + String(bValue) + " Ticket: $" + String(bPrice)
        }
        else{
             bData = "Balcony Full "
        }
        
        if(lValue > 0){
             lData = lType + String(lValue) + " Ticket: $" + String(lPrice)
        }
        else{
             lData = "Lower Level Full "
        }
             
       if(cValue > 0){
        cData = cType + String(cValue) + " Ticket: $" + String(cPrice)
       }
       else{
         cData = "Courtside Full "
        }
             
            data.append(bData)
            data.append(lData)
            data.append(cData)
        
           
        }
    
    //function to update the labels
    func labelUpdate(rowNo: Array<Int>)
    {
        if(rowNo.contains(0)){
                   
                   result = currentNumber * ticket.bPrice
                   Price.text = ("\(result)")
                   ticketType.text = "Balcony Level"
                   ticket.type = "Balcony Level"
                    ticket.bType = "Balcony"
                   ticket.price = result
                   ticket.quantity = currentNumber
                   
                  
               } else if(rowNo.contains(1)){
                   result = currentNumber * ticket.lPrice
                   Price.text = ("\(result)")
                   ticketType.text = "Lower Level"
                   ticket.type = "Lower Level"
                   ticket.lType = "Lower Level"
                   ticket.price = result
                   ticket.quantity = currentNumber
                  
               } else {
                   result = currentNumber * ticket.cPrice
                   Price.text = ("\(result)")
                   ticketType.text = "Courtside"
                   ticket.cType = "Courtside"
                   ticket.type = "Courtside"
                    ticket.price = result
                    ticket.quantity = currentNumber
                   
               }
        let now = Date()

        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.timeStyle = .full

        let datetime = formatter.string(from: now)
        ticket.date = datetime
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
      return data[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){

        let rowNo = [pickerView.selectedRow(inComponent: 0)]
        labelUpdate(rowNo: rowNo)
       
    }
    

    @IBAction func digit_Pressed(_ sender: Any) {
        
        currentNumber = (Int((sender as AnyObject).titleLabel?.text ?? "") ?? 0)
        Quantity.text = ("\(currentNumber)")
    }
   
    
    @IBAction func buy_Pressed(_ sender: Any) {
        let rowNo = [picker.selectedRow(inComponent: 0)]
        
        if(rowNo.contains(0)){
            if(ticket.bValue > 0){
                ticket.bValue -= currentNumber
               
               }
               else{
                ticket.bValue = 0
               }
              } else if(rowNo.contains(1)){
            if(ticket.lValue > 0){
                    ticket.lValue -= currentNumber
                   
                  }
                  else{
                    ticket.lValue = 0
                  }
                 
              } else {
            if(ticket.cValue > 0){
                ticket.cValue -= currentNumber
                    
                  }
                  else{
                ticket.cValue = 0
                  }
              }
        
            self.picker.reloadAllComponents()
            
            labelUpdate(rowNo: rowNo)
        valueUpdate(bValue: ticket.bValue, lValue:ticket.lValue,cValue: ticket.cValue,bPrice: ticket.bPrice,lPrice: ticket.lPrice,cPrice:  ticket.cPrice, bType: ticket.bType, lType: ticket.lType, cType: ticket.cType)
            self.information.insert(ticket,at:0)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(information)
        if segue.identifier == "SecondSeque"{
            let otherVc = segue.destination as! SecondViewController 
            otherVc.tInformation = information
        }
    }
    
    //new method added for processing the values fetched from Json Github
        
    func fetchData(){
        let manager = JSONManager()
        manager.fetchJSONData { (datavalue) in
            self.ticket.bValue = datavalue[0].quantity
            self.ticket.lValue = datavalue[1].quantity
            self.ticket.cValue = datavalue[2].quantity
            self.ticket.bPrice = datavalue[0].price
            self.ticket.lPrice = datavalue[1].price
            self.ticket.cPrice = datavalue[2].price
            self.ticket.bType = datavalue[0].type
            self.ticket.lType = datavalue[1].type
            self.ticket.cType = datavalue[2].type
             
            self.valueUpdate(bValue: datavalue[0].quantity, lValue: datavalue[1].quantity,cValue: datavalue[2].quantity,bPrice: datavalue[1].price,lPrice: datavalue[1].price,cPrice:  datavalue[2].price, bType:datavalue[0].type, lType :datavalue[1].type, cType: datavalue[2].type  )
          DispatchQueue.main.async {
                    self.picker.reloadAllComponents()
            }
        }
        
    }


    
    

    
}

