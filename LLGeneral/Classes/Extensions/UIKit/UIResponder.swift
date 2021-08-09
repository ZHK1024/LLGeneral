//
//  UIResponder.swift
//  LLGeneral
//
//  Created by ZHK on 2021/8/9.
//  
//

import Foundation

extension UIResponder {
    
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
