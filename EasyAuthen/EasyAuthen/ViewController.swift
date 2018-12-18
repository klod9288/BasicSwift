//
//  ViewController.swift
//  EasyAuthen
//
//  Created by Srongklod on 17/12/2561 BE.
//  Copyright © 2561 Srongklod_B. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Explicit
    var user: String = ""
    var password: String = ""
    
    
    
    @IBOutlet weak var userTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    @IBAction func loginButton(_ sender: Any) {
        
        //Check Click
        print("Click loginButton")
        
        //Get Value From TextField
        
        user = userTextField.text!
        password = passwordTextField.text!
        print("user ==>\(user)")
        print("password ==> \(password)")
        
        //Check space
        if (user.count == 0) || (password == "") {
//            Have Space
            print("Have Space")
            
        }else{
//            No Space
            
            print("No Space")
            
        }
        
        
        
        
    }//Login Button Funtion
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }//Main funtion


}//Main Class

