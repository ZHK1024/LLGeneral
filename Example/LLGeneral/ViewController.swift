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
        
//        navigationController?.pushViewController(<#T##viewControllers: [UIViewController]##[UIViewController]#>, animated: <#T##Bool#>)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(find(finder: { $0 as? UINavigationController }))
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
    
    private let list:[[String]] = [
        ["Navigation 一次 Push 多个 VC"]
    ]
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = list[indexPath.section][indexPath.row]
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch (indexPath.section, indexPath.row) {
        case (0, 0):
            navigationController?.pushViewController([
                viewController(.red),
                viewController(.yellow)
            ], animated: true)
        default: break
        }
    }
}

extension ViewController {
    
    private func viewController(_ backgroundColor: UIColor) -> UIViewController {
        let vc = UIViewController()
        vc.view.backgroundColor = backgroundColor
        vc.navigationItem.backButtonTitle = ""
        return vc
    }
}
