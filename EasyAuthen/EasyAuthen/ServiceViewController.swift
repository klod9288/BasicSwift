//
//  ServiceViewController.swift
//  EasyAuthen
//
//  Created by Srongklod on 29/12/2561 BE.
//  Copyright © 2561 Srongklod_B. All rights reserved.
//

import UIKit

class ServiceViewController: UIViewController, UITabBarDelegate,UITableViewDataSource {
    //Explicit
    var myConstant = MyConstant()
    var showData: Array<String>?
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (showData?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("showData ==> \(String(describing: showData))")
        
        let objCell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        objCell.textLabel?.text = showData![indexPath.row]
        return objCell
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        showData = myConstant.getTestData()
        
        readJSON()
       
    }//Main funtion
    
    func readJSON() -> Void {
        
        let urlPHP = myConstant.getAllData()
        guard let url = URL(string: urlPHP) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            
            guard let dataResponse = data, error == nil else {
                
                print("Error")
                return
                
            }
            
            do {
                
                let jsonResponse = try JSONSerialization.jsonObject(with: dataResponse, options: [])
                print("jsonResponse ==> \(jsonResponse)")
                
            } catch let myError {
                
                print(myError)
                
            }
            
        }//end task
        task.resume()
        
    }
    

}//Main Class
