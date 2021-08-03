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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        about_setupUI()
        
//        print("aa@qq.com".matches(regular: "^[\\w]+@[\\w.]+$"))
//        "aa@qq.com".matches(regular: "^[\\w]+@[\\w.]+$") {
//            print($0)
//            return true
//        }
        
//        testPrivacyPolicy()
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// 隐私政策
    func testPrivacyPolicy() {
        guard let path = Bundle.main.path(forResource: "PrivacyPolicy.md", ofType: nil),
              let text = try? String(contentsOfFile: path, encoding: .utf8) else {
            return
        }
        
        print(LLPrivacyPolicy.authorizationStatus)
        
        LLPrivacyPolicy.resetAuthorizationStatus()
        
        
        let modifier = LLPrivacyPolicyModifier()
        modifier.title = NSAttributedString(string: "隐私政策", attributes: [
            .font : UIFont.boldSystemFont(ofSize: 18.0)
        ])
        modifier.titleContentInsets = .only(top: 25.0)
        
        LLPrivacyPolicy.requestAuthorization(policy: text, modifier: modifier) { status in
            print(status)
        }
        
//        LLPrivacyPolicy.requestAuthorization(policyURL: URL(string: "https://maka.im/appweb/mori/private_policy")!) { status in
//            print(status)
//        }
        
        
        
        
    }
}

/*
 
 
 textView.text = """
     
     """
 */
