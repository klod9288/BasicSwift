//
//  MyConstant.swift
//  EasyAuthen
//
//  Created by Srongklod on 17/1/2562 BE.
//  Copyright © 2562 Srongklod_B. All rights reserved.
//

import Foundation

class MyConstant {
    //Explicit
    let testData = ["test1","test2","test3","test4","test5","test6","test7","test8","test9","test10",]
    let urlGetAllData: String = "https://www.androidthai.in.th/bua/getAllData.php"
    
    func getAllData() -> String {
        return urlGetAllData
    }
    
    func getTestData() -> Array<String> {
        return testData
    }
    
    
}//Main Class
