//
//  UIEdgeInsets.swift
//  Pods-ZHKSwiftExtension_Example
//
//  Created by ZHK on 2020/9/7.
//  
//

import UIKit

extension UIEdgeInsets {
    
    /// The sum of horizontal spacing
    public var shSpacing: CGFloat {
        return left + right
    }
    
    /// The sum of vertical spacing
    public var svSpacing: CGFloat {
        return top + bottom
    }
    
    public static func all(_ value: CGFloat) -> UIEdgeInsets  {
        UIEdgeInsets(top: value, left: value, bottom: value, right: value)
    }
    
    public static func only(top: CGFloat = 0, left: CGFloat = 0, bottom: CGFloat = 0, right: CGFloat = 0) -> UIEdgeInsets {
        UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }
    
    public static func - (left: UIEdgeInsets, right: UIEdgeInsets) -> UIEdgeInsets {
        UIEdgeInsets(top: left.top - right.top ,
                     left: left.left - right.left,
                     bottom: left.bottom - right.bottom,
                     right: left.right - right.right)
    }
    
    public static func + (left: UIEdgeInsets, right: UIEdgeInsets) -> UIEdgeInsets {
        UIEdgeInsets(top: left.top + right.top ,
                     left: left.left + right.left,
                     bottom: left.bottom + right.bottom,
                     right: left.right + right.right)
    }
}
