//
//  ResetViewController.swift
//  TicketApp
//
//  Created by jacob n johar on 19/10/20.
//  Copyright © 2020 Jacob johar. All rights reserved.
//

import UIKit

class ResetViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource{
    
    @IBOutlet weak var Amount: UITextField!
    @IBOutlet weak var Count: UITextField!
   
    @IBOutlet weak var pickerView: UIPickerView!
    var infoData:[Ticket] = [Ticket]()
   
    var info = [" "]
    var bData = " "
    var lData = " "
    var cData = " "
    override func viewDidLoad() {
           super.viewDidLoad()
          
          for data in infoData {
            valueUpdate(bValue: data.bValue,lValue: data.lValue, cValue: data.cValue, bPrice: data.bPrice,lPrice: data.lPrice, cPrice: data.cPrice )
          }
       }

     //function to update the labels
     func labelUpdate(rowNo: Array<Int>)
     {
         let tempCount = Count.text!
         let tempPrice = Amount.text!
         if(rowNo.contains(0)){
             for data in infoData {
                 valueUpdate(bValue: Int(tempCount) ?? data.bValue,lValue: data.lValue, cValue: data.cValue, bPrice: Int(tempPrice) ?? data.bPrice,lPrice: data.lPrice, cPrice: data.cPrice )
             }
           
         }
         else if(rowNo.contains(1)){
             for data in infoData {
                 valueUpdate(bValue:data.bValue,lValue: Int(tempCount) ?? data.lValue, cValue: data.cValue, bPrice: data.bPrice,lPrice: Int(tempPrice) ?? data.lPrice, cPrice: data.cPrice )
             }
           
         }
         else{
             for data in infoData {
                   valueUpdate(bValue:data.bValue,lValue: Int(tempCount) ?? data.lValue, cValue: Int(tempCount) ?? data.cValue, bPrice: Int(tempPrice) ?? data.bPrice,lPrice: Int(tempPrice) ?? data.lPrice, cPrice: Int(tempPrice) ?? data.cPrice )
               }
         }
         pickerView.reloadAllComponents()
       
         
     }
    @IBAction func ok_Pressed(_ sender: Any) {
        
         let rowNo = [pickerView.selectedRow(inComponent: 0)]
         labelUpdate(rowNo: rowNo)
        pickerView.reloadAllComponents()
      
        
    }
    
    @IBAction func cancel_Pressed(_ sender: Any) {
        Count.text = "0"
        Amount.text = "0"
        
        
    }
    
    //Function to update the values in picker
   func valueUpdate(bValue: Int,lValue: Int, cValue: Int, bPrice: Int,lPrice: Int, cPrice: Int ) {
        info.removeAll()
        if(bValue > 0){
            bData = "Balcony " + String(bValue) + " Ticket: $" + String(bPrice)
        }
        else{
             bData = "Balcony Full "
        }
        
        if(lValue > 0){
             lData = "Lower Level " + String(lValue) + " Ticket: $" + String(lPrice)
        }
        else{
             lData = "Lower Level Full "
        }
             
       if(cValue > 0){
        cData = "Courtside " + String(cValue) + " Ticket: $" + String(cPrice)
       }
       else{
         cData = "Courtside Full "
        }
     
             
            info.append(bData)
            info.append(lData)
            info.append(cData)
    
            
        }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return info.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
      return info[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){

        let rowNo = [pickerView.selectedRow(inComponent: 0)]
        labelUpdate(rowNo: rowNo)
    }
           
       
}
