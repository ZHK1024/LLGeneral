//
//  ViewController.swift
//  LLGeneral
//
//  Created by ruris on 04/13/2021.
//  Copyright (c) 2021 ruris. All rights reserved.
//

import UIKit
import LLGeneral

class ViewController: UIViewController {
//    typealias Model = <#type#>
    
    
//    typealias Model = <#type#>

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        about_setupUI()
        
        print("aa@qq.com".matches(regular: "^[\\w]+@[\\w.]+$"))
//        "aa@qq.com".matches(regular: "^[\\w]+@[\\w.]+$") {
//            print($0)
//            return true
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

