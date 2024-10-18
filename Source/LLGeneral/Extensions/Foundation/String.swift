//
//  String.swift
//  LLGeneral
//
//  Created by ZHK on 2021/6/4.
//  
//

import Foundation

extension String {
    
    /// 利用正则表达式校验字符串
    /// - Parameter regular: 正则表达式
    /// - Returns: 匹配结果
    public func matches(regular: String) -> Bool {
        matches(regular: regular) { $0.count == 1 }
    }
    
    /// 利用正则表达式匹配字符串
    /// - Parameters:
    ///   - regular: 正则表达式
    ///   - execute: 判断逻辑
    /// - Returns: 是否匹配成功
    public func matches(regular: String, execute: ([NSTextCheckingResult]) -> Bool) -> Bool {
        do {
            return execute(try matches(regular: regular,
                                       regxOptions: .allowCommentsAndWhitespace,
                                       matchesOptions: .anchored))
        } catch {
            #if DEBUG
            print(error)
            #endif
            return false
        }
    }
    
    /// 利用正则表达式匹配字符串中的内容
    /// - Parameters:
    ///   - regular:        正则表达式
    ///   - regxOptions:    正则表达式选项
    ///   - matchesOptions: 正则表达式匹配规则
    /// - Throws:  异常信息
    /// - Returns: 匹配结果
    public func matches(regular: String,
                       regxOptions: NSRegularExpression.Options,
                       matchesOptions: NSRegularExpression.MatchingOptions) throws -> [NSTextCheckingResult] {
        let regx = try NSRegularExpression(pattern: regular, options: regxOptions)
        return regx.matches(in: self, options: matchesOptions, range: NSRange(location: 0, length: self.count))
    }
}
