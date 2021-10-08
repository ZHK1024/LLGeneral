//
//  UINavigationController.swift
//  LLGeneral
//
//  Created by ZHK on 2021/10/8.
//  
//

import UIKit

public extension UINavigationController {
    
    /// 一次 `Push` 多个 `UIViewController`
    /// 直接显示数组最后一个 `UIViewController` 对象, `Pop` 顺序为数组倒序
    /// 同 `pushViewController(_ viewController: UIViewController, animated: Bool)` 一样
    /// - Parameters:
    ///   - viewControllers: `UIViewController` 数组
    ///   - animated: 是否发生过场动画
    func pushViewController(_ viewControllers: [UIViewController], animated: Bool) {
        guard let last = viewControllers.last else { return }
        pushViewController(last, animated: animated)
        if viewControllers.count > 1 {
            self.viewControllers.insert(contentsOf: viewControllers[..<(viewControllers.endIndex - 1)],
                                        at: self.viewControllers.endIndex - 1)
        }
    }
    
}
