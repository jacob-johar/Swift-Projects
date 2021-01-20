//
//  Login.swift
//  Login
//
//  Created by jacob n johar on 16/07/17.
//  Copyright © 2017 Jacob johar. All rights reserved.
//

import UIKit


class Login: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginLabel: UILabel!
    
    @IBOutlet weak var cloud1: UIImageView!

    @IBOutlet weak var cloud2: UIImageView!
    @IBOutlet weak var cloud3: UIImageView!
    @IBOutlet weak var cloud4: UIImageView!
    
  
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let blueColor : UIColor = UIColor( red: 68.0/255, green: 126.0/255, blue:194.0/255, alpha: 1.0 )
        
        //Implementing Layers,Border Color & Width
        emailTextField.layer.borderColor = blueColor.cgColor
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.cornerRadius = 15
        
        passwordTextField.layer.borderColor = blueColor.cgColor
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.cornerRadius = 15
        loginButton.layer.cornerRadius = 15
        
        //Setting Delegates
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        //Moving the elements off-screen
        loginLabel.center.y -= view.bounds.width
        emailTextField.center.x -= view.bounds.width
        passwordTextField.center.x += view.bounds.width
        
        //Setting Alpha for Login button
        loginButton.alpha = 0.0
        
        //Setting alpha to clouds
        cloud1.alpha = 0.0
        cloud2.alpha = 0.0
        cloud3.alpha = 0.0
        cloud4.alpha = 0.0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        //Bringing back the login label with animation
        UIView.animate(withDuration: 2.0, animations: {
            self.loginLabel.center.y += self.view.bounds.width
        })
        
        //Using spring animation in email and password textFields
        UIView.animate(withDuration: 1.5, delay: 0.5,
                       usingSpringWithDamping: 0.3,
                       initialSpringVelocity: 0.5,
                       options: [], animations: {
                        self.emailTextField.center.x += self.view.bounds.width
                        self.passwordTextField.center.x -= self.view.bounds.width
            }, completion: nil)
        
        //Achieving Fade-in animation with alpha
        UIView.animate(withDuration: 1.0, delay: 2.0,
                       options: [],
                       animations: {
                        self.loginButton.alpha = 1.0
            }, completion: nil)
        
        
        UIView.animate(withDuration: 0.5, delay: 0.6, options: [], animations: {
            self.cloud1.alpha = 1.0
            }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.8, options: [], animations: {
            self.cloud2.alpha = 1.0
            }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 1.0, options: [], animations: {
            self.cloud3.alpha = 1.0
            }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 1.2, options: [], animations: {
            self.cloud4.alpha = 1.0
            }, completion: nil)
        
        //Calling animateTheClouds()
        animateTheClouds(cloud1)
        animateTheClouds(cloud2)
        animateTheClouds(cloud3)
        animateTheClouds(cloud4)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Resign First Responder to hide keyboard when enter is clicked
    func textFieldShouldReturn(_ userText: UITextField) -> Bool {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return true;
    }
    
    //function to add animation loop to clouds
    func animateTheClouds(_ cloud : UIImageView) {
        let cloudMovingSpeed = 60.0/view.frame.size.width
        let duration = (view.frame.size.width - cloud.frame.origin.x) * cloudMovingSpeed
        UIView.animate(withDuration: TimeInterval(duration), delay: 0.0, options: .curveLinear, animations: {
            cloud.frame.origin.x = self.view.frame.size.width
            }, completion: {_ in
                cloud.frame.origin.x = -cloud.frame.size.width
                self.animateTheClouds(cloud)
        })
    }
    
    
}

