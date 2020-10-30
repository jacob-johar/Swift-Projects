//
//  ViewController.swift
//  PhotoAlbum
//
//  Created by jacob n johar on 29/10/20.
//  Copyright © 2020 Jacob johar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    
    var  imageData  : Data?
    var  count = 0
    var i = 0
    var img =
        ["https://images.freeimages.com/images/large-previews/bbf/candle-1423706.jpg",
        "https://images.freeimages.com/images/large-previews/44c/blue-and-yellow-macaw-1641749.jpg",
       "https://images.freeimages.com/images/large-previews/975/bugambilia-close-up-1641758.jpg",
       "https://images.freeimages.com/images/large-previews/36e/black-fly-1641767.jpg",
       "https://images.freeimages.com/images/large-previews/5f7/hunter-s-bend-1316926.jpg"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         retriveImage(i : 0,imgView :imgView)
        imgView.isUserInteractionEnabled = true
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)

        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
    
    }
    
    //function for controlling swift direction
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {

        if let swipeGesture = gesture as? UISwipeGestureRecognizer {

            switch swipeGesture.direction {
            case .right:
                gestureFiredRight()
            case .left:
                gestureFiredLeft()
            default:
                break
            }
        }
    }
  
    
     //functionality for next and right swipe
 public func gestureFiredRight()
  {

    count += 1
             
    if(count == 5 ){
            count = 0
             }
    retriveImage(i : count,imgView :imgView)
    
    }
    
    //functionality for previous and left swipe
    public func gestureFiredLeft()
     {
      
       
          if(count == 0){
              count = 5
          }
         count -= 1
         
       retriveImage(i : count,imgView :imgView)
       
       }
   
    // function for performing action when previous button is pressed
    @IBAction func previousPressed(_ sender: Any) {
        gestureFiredLeft()
        
    }
    
      // function for performing action when next button is pressed
    @IBAction func nextPressed(_ sender: Any) {
        gestureFiredRight()
    }
    
    //function for retriving the image
    func retriveImage(i: Int, imgView : UIImageView){
        let url : URL = URL(string : img[i])!
     
        count = i
        
        let newThread = DispatchQueue.init(label: "newT")
        newThread.async{
            do{
                self.imageData = try Data(contentsOf: url)
                
            }catch{
                print("Error Occurred")
            }
            DispatchQueue.main.async {
                imgView.image = UIImage(data: self.imageData!)
                imgView.contentMode = .scaleAspectFit
                
            }
        }
    }
    


}

