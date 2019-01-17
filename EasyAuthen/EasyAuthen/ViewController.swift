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
    let mySegue: String = "GoToShowProduct"
    var reciveJSON: String?
    
    
    
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
            myAlert(title: "Have Space", massage: "Please Fill Every Blank")
            
        }else{
//            No Space
            
            print("No Space")
            loadJSON(userString: user, passwordString: password)
            
        }//if
        
    }//Login Button Funtion
    
    
    func myAlert(title: String, massage: String) -> Void {
        
        let objAlert = UIAlertController(title: title, message: massage, preferredStyle: UIAlertController.Style.alert)
        objAlert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (UIAlertAction) in
            objAlert.dismiss(animated: true, completion: nil)
        }))
            self.present(objAlert, animated: true, completion: nil)
        
    }//myAlert Function

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }//Main funtion
    
    //ฟังชั่นที่ใช้ JSON ดึงข้อมูลจาก Server ลงมาใช้
    func loadJSON(userString: String, passwordString: String) -> Void {
        let urlPHP: String = "https://androidthai.in.th/bua/getUserWhereUserBua.php?isAdd=true&User=\(userString)"
        print("urlPHP ==>\(urlPHP)")
        //ประกาสตัวแปรใช้เองครับ
        let urlAPI = URL(string: urlPHP)
        let request = NSMutableURLRequest(url: urlAPI!)
                                                                            //ตัวแปรพิมพ์เอง
        let task = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            if (error != nil) {
                print("Have Error ")
            } else{
                if let testData = data {
                    let canReadable = NSString(data: testData, encoding: String.Encoding.utf8.rawValue)
                    print("canReadable ==>\(canReadable!)")
                    let resultJSON = canReadable!
                    if resultJSON == "null" {
                        //User False
                        DispatchQueue.main.async {
                            self.myAlert(title: "User False", massage: "NO This in my Datbase")
                        }
                    } else {
                    var jsonString: String = canReadable! as String //ตัวแปรนี้จะไม่มี optional ขึ้นมา
                    //ฟังชั่นตัดคำ
                    let squareBrackers1 = "["
                    let squereBrackers2 = "]"
                    //ตัดคำตำแหน่งที่1
                    let noPrefixJSON = jsonString.components(separatedBy: squareBrackers1)
                    //ตัดคำตำแหน่งที่2
                    let noSubfixJSON = noPrefixJSON[1].components(separatedBy: squereBrackers2)
                    jsonString = noSubfixJSON[0]
                    //ปริ้นให้ดูข้อมูลว่าได้อะไรมาบ้างตัดแล้วเป็นยังไงครับ
                    print("jsonString ==> \(jsonString)")
                    //เรียกใช้งาน//ฟังชั่นพ่นค่าออกมาโชร์ที่ UI = Call back
                                        self.convertStringToDictionnary(jsonString: jsonString, password: passwordString)
                        
                    }
                }//if
            }//if
        }//task
        task.resume()
    }//loadJSON
    
    
    func convertStringToDictionnary(jsonString: String, password: String) -> Void {
        
        //ดูค่าที่รับค่ามา
        print("reciveJSON ==> \(jsonString)")
        let testJSONung = jsonString
        var myDictionry: NSDictionary?
        
        if let myJSON = jsonString.data(using: String.Encoding.utf8) {
            
            do {
                
                myDictionry = try JSONSerialization.jsonObject(with: myJSON, options: []) as? [String: AnyObject] as NSDictionary?
                
//                print("myDictionnary ==>\(String(describing: myDictionry))")
                
                if let testDict = myDictionry {
                    
                    print("testDictionry ==> \(testDict) ")
                    let truePassword: String = testDict["Password"]! as! String
                    
                    
                    if password == truePassword {
                        
                        DispatchQueue.main.async {
                            self.performSegue(withIdentifier: "GoToShowProduct", sender: self)
                        }
                        
                    } else {
                        
                        DispatchQueue.main.async {
                            self.myAlert(title: "Password False", massage: "Please Try Again Password")
                        }
                    }
                }
            } catch let error as NSError {
                print("convert Error ==>\(error)")
            }//do
        }//if
    }//convertStringToDictionnary
    

}//Main Class

