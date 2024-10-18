//
//  CGSize.swift
//  Pods-ZHKSwiftExtension_Example
//
//  Created by ZHK on 2020/9/7.
//  
//

import UIKit


extension CGSize {
    
    /// 屏幕尺寸
    public static var screen: CGSize { UIScreen.main.bounds.size }
    
    /// 创建一个宽高相同的 CGSize 实例
    /// - Parameter size: 宽高值
    /// - Returns: CGSize 实例
    public static func all(_ size: CGFloat) -> CGSize {
        CGSize(width: size, height: size)
    }
    
    /// 取宽高的一半生成新的 CGSize 实例
    public var half: CGSize {
        CGSize(width: width / 2, height: height / 2)
    }
    
    /// 使用新的 width 生成新的 CGSize 实例
    /// - Parameter width: 新 width 值
    /// - Returns: CGSize 实例
    public func rec(width: CGFloat) -> CGSize {
        CGSize(width: width, height: height)
    }
    
    /// 使用新的 height 生成新的 CGSize 实例
    /// - Parameter height: 新 height 值
    /// - Returns: CGSize 实例
    public func rec(height: CGFloat) -> CGSize {
        CGSize(width: width, height: height)
    }
}
