//
//  CGPoint.swift
//  Pods-ZHKSwiftExtension_Example
//
//  Created by ZHK on 2020/9/7.
//  
//

import Foundation

extension CGPoint {
    
    public static func +(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
}
