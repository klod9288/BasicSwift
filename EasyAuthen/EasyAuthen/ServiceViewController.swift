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
        
        
        
       
    }//Main funtion
    
    
    

}//Main Class
