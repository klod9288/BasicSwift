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
    var user:String = ""
    var paasword:String = ""
    
    
    
    @IBOutlet weak var userTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    @IBAction func loginButton(_ sender: Any) {
        
        print("Click loginButton")
        
        
    }//Login Button Funtion
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }//Main funtion


}//Main Class

