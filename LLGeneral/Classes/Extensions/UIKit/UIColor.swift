//
//  UIColor.swift
//  ZHKSwiftExtension
//
//  Created by ZHK on 2018/8/20.
//  Copyright © 2018年 ZHK. All rights reserved.
//

import UIKit

extension UIColor {
    
    /// 根据 RGB 值初始化 UIColor 对象 (0~255)
    /// - Parameters:
    ///   - red:   红
    ///   - greeb: 绿
    ///   - blue:  蓝
    /// - Returns: UIColor 对象
    public static func rgb(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat) -> UIColor {
        .rgba(red, green, blue, 1)
    }
    
    /// 根据 RGBA 值初始化 UIColor 对象 (RGB: 0~255, A: 0.0~1.0)
    /// - Parameters:
    ///   - red:   红
    ///   - greeb: 绿
    ///   - blue:  蓝
    ///   - alpha: 不透明度
    /// - Returns: UIColor 对象
    public static func rgba(_ red: CGFloat, _ greeb: CGFloat, _ blue: CGFloat, _ alpha: CGFloat) -> UIColor {
        UIColor(red: red / 255.0, green: greeb / 255.0, blue: blue / 255.0, alpha: alpha)
    }
    
    /// 灰色
    /// - Parameters:
    ///   - value: RGB 值
    ///   - alpha: 透明度
    /// - Returns: UIColor 对象
    public static func gray(_ value: CGFloat, _ alpha: CGFloat = 1.0) -> UIColor {
        .rgba(value, value, value, alpha)
    }
    
    /// 随机颜色
    public static var random: UIColor {
        .init(red: CGFloat.random(in: 0.0...1.0),
              green: CGFloat.random(in: 0.0...1.0),
              blue: CGFloat.random(in: 0.0...1.0),
              alpha: 1)
    }
}
