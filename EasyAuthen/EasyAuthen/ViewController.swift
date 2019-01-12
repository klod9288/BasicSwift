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
    let urlPHP: String = "https://www.androidthai.in.th/bua/getAllData.php"

    let demoData = ["user1":"1231","user2":"1232","user3":"1233","user4":"1234","user5":"1235",]
    
    
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
            checkUserAnPassword(userString: user, passwordString: password)
            
        }//if
        
    }//Login Button Funtion
    
    func checkUserAnPassword(userString:String,passwordString:String) -> Void {
        
        //test variable Nil ?
        if let testPassword = demoData[userString] {
            
            let truePassword = testPassword
            print("truePassword ==> " + truePassword)
            
            if (passwordString == truePassword) {
                
                //Success Authen true
                performSegue(withIdentifier: mySegue, sender: self)
                
                
                
            } else {
                
                //Authe False
                myAlert(title: "Password False", massage: "Please Try Again Pasword False")
                
            }
            
        }else{
            
            myAlert(title: "User False", massage: "No \(userString) in my Database")
            
        }
        
        
      //  let truePassword = demoData[userString]
     //   print("truePassword ==> "+truePassword!)
        
    }
    
    func myAlert(title: String, massage: String) -> Void {
        
        let objAlert = UIAlertController(title: title, message: massage, preferredStyle: UIAlertController.Style.alert)
        objAlert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (UIAlertAction) in
            objAlert.dismiss(animated: true, completion: nil)
        }))
            self.present(objAlert, animated: true, completion: nil)
        
    }//myAlert Function
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadJSON()
        
        
        
    }//Main funtion
    
    
    //ฟังชั่นที่ใช้ JSON ดึงข้อมูลจาก Server ลงมาใช้
    func loadJSON() -> Void {
        
        print("loadJSON Work")
        
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
//                    print("canReadable ==>\(String(describing: canReadable))")
                    
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
//                    print("jsonString ==> \(jsonString)")
                    
                    
                    //เรียกใช้งาน//ฟังชั่นพ่นค่าออกมาโชร์ที่ UI = Call back
                    self.convertStringToDictionnary(jsonString: jsonString)
                    
                    
                }//if
                
            }//if
            
        }//task
        
        task.resume()
        
        
        
        
    }//loadJSON
    
    
    func convertStringToDictionnary(jsonString: String) -> Void {
        
        //ดูค่าที่รับค่ามา
        print("reciveJSON ==> \(jsonString)")
        
//        let testJSONung = "{\"user1":\"1231\"}"
        
        
        let testJSONung = jsonString
        
        
        var myDictionry: NSDictionary?
        
        if let myJSON = jsonString.data(using: String.Encoding.utf8) {
            
            do {
                
                myDictionry = try JSONSerialization.jsonObject(with: myJSON, options: []) as? [String: AnyObject] as NSDictionary?
                
//                print("myDictionnary ==>\(String(describing: myDictionry))")
                
                if let testDict = myDictionry {
                    
                    print("testDictionry ==> \(testDict) ")
                    
                }
                
            } catch let error as NSError {
                
                print("convert Error ==>\(error)")
                
            }//do
            
            
        }//if
        
        
    }//convertStringToDictionnary
    

}//Main Class

