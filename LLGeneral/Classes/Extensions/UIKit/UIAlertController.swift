//
//  UIAlertController.swift
//  Mew
//
//  Created by Ruris on 2023/6/19.
//

import UIKit
import SwiftUI

extension UIAlertController {
    
    /// 输入框
    /// - Parameters:
    ///   - title:   标题
    ///   - message: 消息
    ///   - value:   默认输入信息
    ///   - placehodler: 提示信息
    public static func input(title: String? = nil, message: String? = nil, values: [String]? = nil, placehodlers: [String]? = nil, keyboard: UIKeyboardType = .numberPad) async -> [String]? {
        await withCheckedContinuation { continuation in
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            // 添加输入框, count 取 values 和 placeholders 较小的
            let count = min(values?.count ?? 0, placehodlers?.count ?? 0)
            (0..<count).forEach { index in
                let value = values?[index]
                let placehodler = placehodlers?[index]
                alert.addTextField { textField in
                    textField.placeholder = placehodler
                    textField.text = value
                    textField.keyboardType = keyboard
                }
            }
            
            // 添加按钮
            alert.addAction(UIAlertAction(title: "取消", style: .cancel, handler: { _ in
                continuation.resume(with: .success(nil))
            }))
            alert.addAction(UIAlertAction(title: "确定", style: .default, handler: { [weak alert] _ in
                continuation.resume(with: .success(alert?.textFields?.map({ $0.text ?? "" })))
            }))
            UIApplication.rootViewController?.present(alert, animated: true)
        }
    }
    
    /// 输入框
    /// - Parameters:
    ///   - title:   标题
    ///   - message: 消息
    ///   - value:   默认输入信息
    ///   - placehodler: 提示信息
    public static func confirm(_ viewController: UIViewController? = nil , title: String? = nil, message: String? = nil, cancel: String = "取消", confirm: String = "确定", confirmStyle: UIAlertAction.Style = .default) async -> Bool {
        await withCheckedContinuation { continuation in
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            // 添加按钮
            alert.addAction(UIAlertAction(title: cancel, style: .cancel, handler: { _ in
                continuation.resume(with: .success(false))
            }))
            alert.addAction(UIAlertAction(title: confirm, style: confirmStyle, handler: { _ in
                continuation.resume(with: .success(true))
            }))
            (viewController ?? UIApplication.rootViewController)?.present(alert, animated: true)
        }
    }
}
