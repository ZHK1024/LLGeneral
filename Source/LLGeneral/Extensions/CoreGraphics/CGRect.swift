//
//  CGRect.swift
//  Pods-ZHKSwiftExtension_Example
//
//  Created by ZHK on 2020/9/7.
//  
//

import UIKit

extension CGRect {
    
    public var x: CGFloat {
        set { origin = CGPoint(x: newValue, y: y) }
        get { origin.x }
    }
    
    public var y: CGFloat {
        set { origin = CGPoint(x: x, y: newValue) }
        get { origin.y }
    }
}

/// 重组 (Recombine)
extension CGRect {
    
    /// 使用新的 x 值重组 CGRect
    /// - Parameter x: x 值
    /// - Returns: 新 CGRect
    public func rec(x: CGFloat) -> CGRect {
        CGRect(x: x , y: y, width: width, height: height)
    }
    
    /// 使用新的 x 值重组 CGRect
    /// - Parameter x: x 值
    /// - Returns: 新 CGRect
    public func rec(y: CGFloat) -> CGRect {
        CGRect(x: x , y: y, width: width, height: height)
    }
    
    /// 使用新的 width 值重组 CGRect
    /// - Parameter width: width 值
    /// - Returns: 新 CGRect
    public func rec(width: CGFloat) -> CGRect {
        CGRect(x: x , y: y, width: width, height: height)
    }
    
    /// 使用新的 height 值重组 CGRect
    /// - Parameter height: height 值
    /// - Returns: 新 CGRect
    public func rec(height: CGFloat) -> CGRect {
        CGRect(x: x , y: y, width: width, height: height)
    }
    
    /// 使用新的 origin 值重组 CGRect
    /// - Parameter origin: origin 值
    /// - Returns: 新 CGRect
    public func rec(origin: CGPoint) -> CGRect {
        CGRect(origin: origin, size: size)
    }
    
    /// 使用新的 size 值重组 CGRect
    /// - Parameter size: size 值
    /// - Returns: 新 CGRect
    public func rec(size: CGSize) -> CGRect {
        CGRect(origin: origin, size: size)
    }
}

// Read
extension CGRect {
    
    /// UIScreen.main.bounds
    public static var screen: CGRect { UIScreen.main.bounds }
}

//infix operator + : AssignmentPrecedence

extension CGRect {
    
    public static func - (letft: CGRect, right: UIEdgeInsets) -> CGRect {
        CGRect(x: letft.origin.x + right.left,
               y: letft.origin.y + right.top,
               width: letft.width - right.left - right.right,
               height: letft.height - right.top - right.bottom
        )
    }

    public static func - (letft: CGRect, right: CGRect) -> CGRect {
        CGRect(x: letft.origin.x + right.origin.x,
               y: letft.origin.y + right.origin.y,
               width: letft.width - right.width,
               height: letft.height - right.width
        )
    }
}

extension CGRect {
    
    /// 从给定的 Rect 中裁剪出给定宽高比的新 Rect
    /// - Parameter ratio: 宽高比
    /// - Returns: 生成的新 Rect
    public func subRect(ratio: CGFloat) -> CGRect {
        var x, y, width, height: CGFloat
        if self.width / self.height > ratio {
            width = self.height * ratio
            x = (self.width - width) / 2 + self.x
            y = self.y
            height = self.height
        } else {
            height = self.width / ratio
            x = self.x
            y = (self.height - height) / 2 + self.y
            width = self.width
        }
        return CGRect(x: x, y: y, width: width, height: height)
    }
}
