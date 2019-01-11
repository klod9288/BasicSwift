//
//  RegisterViewController.swift
//  EasyAuthen
//
//  Created by Srongklod on 18/12/2561 BE.
//  Copyright © 2561 Srongklod_B. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var name: String?
    var user: String?
    var password: String?
    
    
    
    
    
    
    
    @IBOutlet weak var nameTextFile: UITextField!
    
    @IBOutlet weak var userTextFile: UITextField!
    
    
    @IBOutlet weak var passwordTextFile: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        

        
    }//Main Funtion
    

    @IBAction func uploadButton(_ sender: Any) {
        
        print("Click Upload")
        
        if let testName = nameTextFile.text {
            name = testName
        }
        
        print("name ==>\(String(describing: name!))")
        
        
        if let testUser = userTextFile.text {
            user = testUser
        }
        
        print("user ==>  \(String(describing: user))")
        
        if let testPassword = passwordTextFile.text {
            password = testPassword
        }
        
        print("password ==> \(String(describing: password))")
        
        
        if (name!.count == 0)||(user!.count == 0) || (password!.count == 0) {
            print("Something Have Space")
        }else{
            
            
            print("No Have Space")
            
            
        }
        
        
        
        
        
    }// Upload
    

}//Main Class
