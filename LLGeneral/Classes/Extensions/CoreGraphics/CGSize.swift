//
//  CGSize.swift
//  Pods-ZHKSwiftExtension_Example
//
//  Created by ZHK on 2020/9/7.
//  
//

import Foundation


extension CGSize {
    
    public static var screen: CGSize { UIScreen.main.bounds.size }
    
    public static func all(_ size: CGFloat) -> CGSize {
        CGSize(width: size, height: size)
    }
    
    public var half: CGSize {
        CGSize(width: width / 2, height: height / 2)
    }
}
