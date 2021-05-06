//
//  LLAboutable.swift
//  LLGeneral
//
//  Created by ZHK on 2021/4/29.
//  
//

import UIKit
import LLObject

public protocol LLAboutable: UIViewController {
    
    associatedtype Model
    
    /// UITableView
    var about_tableView: UITableView { get }
    
    /// UITableView DataSource
    var about_dataSource: UITableViewDataSource { get }
    
    /// UITableView Delegate
    var about_delegate: UITableViewDelegate { get }
}


extension LLAboutable {
    
    /// UITableView
    public var about_tableView: UITableView {
        if let tableView = ll_KVMap["about_tableView"] as? UITableView {
            return tableView
        }
        let tableView = UITableView(frame: view.bounds, style: .grouped)
        ll_KVMap["about_tableView"] = tableView
        return tableView
    }
    
    /// UITableView DataSource
    public var about_dataSource: UITableViewDataSource {
        if let object = ll_KVMap["about_dataSource"] as? LLTableDataSourceDelegate {
            return object
        }
        let object = LLTableDataSourceDelegate()
        ll_KVMap["about_dataSource"] = object
        return object
    }
    
    /// UITableView Delegate
    public var about_delegate: UITableViewDelegate {
        if let object = ll_KVMap["about_dataSource"] as? LLTableDataSourceDelegate {
            return object
        }
        let object = LLTableDataSourceDelegate()
        ll_KVMap["about_dataSource"] = object
        return object
    }
    
    public func about_setupUI() {
        view.addSubview(about_tableView)

        about_tableView.dataSource = about_dataSource
        about_tableView.delegate = about_delegate
        
        about_tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
}


class LLTableDataSourceDelegate: NSObject {
    
}

extension LLTableDataSourceDelegate: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    }
}

extension LLTableDataSourceDelegate: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
