//
//  Clampable.swift
//  Pods-SwiftMath_Example
//
//  Created by ZHK on 2020/9/2.
//  
//

import Foundation

public protocol Clampable: Comparable {
    
    /// 把对象限制在给定区间内
    /// - Parameter range: 指定的限制区间
    func clamp(_ range: ClosedRange<Self>) -> Self
    
    /// 把对象限制在指定的最小最大值范围内
    /// - Parameters:
    ///   - min: 最小值
    ///   - max: 最大值
    func clamp(min: Self, max: Self) -> Self
    
    /// 把 value 限定在给定区间内
    /// - Parameters:
    ///   - value: 指定值
    ///   - range: 范围区间
    static func clamp(value: Self, range: ClosedRange<Self>) -> Self
    
    /// 把 value 限定在指定的最小最大值范围内
    /// - Parameters:
    ///   - value: 给定的值
    ///   - min:   最小值
    ///   - max:   最大值
    static func clamp(value: Self, min: Self, max: Self) -> Self
}

public extension Clampable {
    
    func clamp(_ range: ClosedRange<Self>) -> Self {
        Self.clamp(value: self, min: range.lowerBound, max: range.upperBound)
    }
    
    func clamp(min: Self, max: Self) -> Self {
        Self.clamp(value: self, min: min, max: max)
    }
    
    static func clamp(value: Self, range: ClosedRange<Self>) -> Self {
        clamp(value: value, min: range.lowerBound, max: range.upperBound)
    }
    
    static func clamp(value: Self, min: Self, max: Self) -> Self {
        if value < min { return min }
        if value > max { return max }
        return value
    }
}

extension Int: Clampable {}

extension Int8: Clampable {}

extension Int16: Clampable {}

extension Int32: Clampable {}

extension Int64: Clampable {}

extension UInt: Clampable {}

extension UInt8: Clampable {}

extension UInt16: Clampable {}

extension UInt32: Clampable {}

extension UInt64: Clampable {}

// Float = Float32
extension Float: Clampable {}

// Double = Float64
extension Double: Clampable {}

extension Decimal: Clampable {}

extension Character: Clampable {}

#if os(iOS)

extension CGFloat: Clampable {}

#endif

#if os(macOS)

extension CGFloat: Clampable {}

extension Float80: Clampable {}
    
#endif
