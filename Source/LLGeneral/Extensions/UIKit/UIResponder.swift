//
//  UIResponder.swift
//  LLGeneral
//
//  Created by ZHK on 2021/8/9.
//  
//

import UIKit

extension UIResponder {
    
    /// **注意**
    /// `find` 方法不能在 `viewDidLoad` 中调用, 获取到的值一直是 `nil`
    /// 原因: `viewDidLoad` 被调用的时候, `view` 还未被添加到上一层级的视图上,  所以 `view.superView = nil`.
    ///       1. `view.nextResponder = view.superView`
    ///       2. `UIViewController.nextResponder = view.nextResponder`
    ///       因此此刻 `UIViewController.nextResponder` 为 `nil` 导致 `find` 方法不能遍历完整的 `响应链` 因此无法获取正确的结果.
    
    
    /// 根据条件查找响应链上的 `UIResponder` 子类对象
    /// - Parameter finder: 查找逻辑
    /// - Returns: 查找结果
    public func find<T: UIResponder>(finder: (UIResponder) throws -> T?) rethrows -> T? {
        if let obj = self as? T, let view = try finder(obj) {
            return view
        }
        return try next?.find(finder: finder)
    }
    
    /// 根据条件查找响应链上的 `UIResponder` 子类对象
    /// - Parameters:
    ///   - skip:      跳过次数 (达到查找第 skip 个对象的目的)
    ///   - transform: 查找逻辑
    /// - Returns: 查找结果
    public func find<T: UIResponder>(skip: Int ,transform: (UIResponder) throws -> Bool) rethrows -> T? {
        if let view = self as? T, try transform(view) {
            if skip > 0 {
                return try next?.find(skip: skip - 1 ,transform: transform)
            }
            return view
        }
        return try next?.find(skip: skip ,transform: transform)
    }
}
