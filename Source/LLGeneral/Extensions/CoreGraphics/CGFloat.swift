//
//  CGFloat.swift
//  Pods-ZHKSwiftExtension_Example
//
//  Created by ZHK on 2020/9/7.
//  
//

import UIKit

extension CGFloat {
    
    /// 屏幕宽度比
    public static let scaleX = UIScreen.width / 414.0
    public static let scaleY = UIScreen.height / 818.0
    
    /// 一像素
    public static let pix_1 = 1 / UIScreen.main.scale
    
    /// 按屏幕宽度比例计算的常用数字
    public static let float3  = 03.0 * CGFloat.scaleX
    public static let float5  = 05.0 * CGFloat.scaleX
    public static let float6  = 06.0 * CGFloat.scaleX
    public static let float7  = 07.0 * CGFloat.scaleX
    public static let float8  = 08.0 * CGFloat.scaleX
    public static let float9  = 09.0 * CGFloat.scaleX
    public static let float10 = 10.0 * CGFloat.scaleX
    public static let float11 = 11.0 * CGFloat.scaleX
    public static let float12 = 12.0 * CGFloat.scaleX
    public static let float13 = 13.0 * CGFloat.scaleX
    public static let float14 = 14.0 * CGFloat.scaleX
    public static let float15 = 15.0 * CGFloat.scaleX
    public static let float16 = 16.0 * CGFloat.scaleX
    public static let float17 = 17.0 * CGFloat.scaleX
    public static let float18 = 18.0 * CGFloat.scaleX
    public static let float19 = 19.0 * CGFloat.scaleX
    public static let float20 = 20.0 * CGFloat.scaleX
    public static let float23 = 23.0 * CGFloat.scaleX
    public static let float24 = 24.0 * CGFloat.scaleX
    
    /// 状态栏高度
    public static var statusBarHeight: CGFloat {
        return UIApplication.shared.statusBarFrame.height
    }
}

extension CGFloat {
    
    /// 改为屏幕宽度 (width) 比例缩放后的结果
    public var xfix: CGFloat {
        self * .scaleX
    }
    
    /// 改为屏幕高度 (height) 比例缩放后的结果
    public var yfix: CGFloat {
        self * .scaleY
    }
    
    /// 屏幕像素对齐
    public var flat: CGFloat {
        ceil(self * UIScreen.main.scale) / UIScreen.main.scale
    }
}

/// 常数 (3.0) 被判定为 Double, 因此 Double 也添加了此扩展
extension Double {
    
    /// 改为屏幕宽度 (width) 比例缩放后的结果
    public var xfix: CGFloat {
        CGFloat(self) * CGFloat.scaleX
    }
    
    /// 改为屏幕高度 (height) 比例缩放后的结果
    public var yfix: CGFloat {
        CGFloat(self) * CGFloat.scaleY
    }
    
    /// 屏幕像素对齐
    public var flat: CGFloat {
        ceil(CGFloat(self) * UIScreen.main.scale) / UIScreen.main.scale
    }
}

extension CGFloat {
    
    /// 屏幕宽度
    public static var screenWidth: CGFloat { UIScreen.main.bounds.width }
    
    /// 屏幕高度
    public static var screenHeight: CGFloat { UIScreen.main.bounds.height }
}
