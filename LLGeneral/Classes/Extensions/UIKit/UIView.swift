//
//  UIView.swift
//  LLGeneral
//
//  Created by ZHK on 2021/8/2.
//  
//

import UIKit


extension UIView {
    
    /// bounds.origin.x
    public var x: CGFloat { bounds.origin.x }
    
    /// bounds.origin.y
    public var y: CGFloat { bounds.origin.y }
    
    /// bounds.width
    public var width: CGFloat { bounds.width }
    
    /// bounds.height
    public var height: CGFloat { bounds.height }
    
    /// bounds.origin
    public var origin: CGPoint { bounds.origin }
    
    /// bounds.size
    public var size: CGSize { bounds.size }
    
    /// 安全距离 x, 同 safeAreaInsets.left
    public var safeX: CGFloat { safeAreaInsets.left }
    
    /// 安全距离 y, 同 safeAreaInsets.top
    public var safeY: CGFloat { safeAreaInsets.top }
    
    /// safeAreaInsets.left
    public var safeLeft: CGFloat { safeAreaInsets.left }
    
    /// safeAreaInsets.right
    public var safeRight: CGFloat { safeAreaInsets.right }
    
    /// safeAreaInsets.top
    public var safeTop: CGFloat { safeAreaInsets.top }
    
    /// safeAreaInsets.bottom
    public var safeBottom: CGFloat { safeAreaInsets.bottom }
    
    /// 安全宽度 (去除被遮挡区域)
    public var safeWidth: CGFloat {
        bounds.width - safeAreaInsets.left - safeAreaInsets.right
    }
    
    /// 安全高度 (去除被遮挡区域)
    public var safeHeight: CGFloat {
        bounds.height - safeAreaInsets.top - safeAreaInsets.bottom
    }

    /// 视图的安全区域 (bounds - safeArea)
    public var safeRect: CGRect {
        CGRect(x: safeLeft, y: safeTop, width: safeWidth, height: safeHeight)
    }
}

