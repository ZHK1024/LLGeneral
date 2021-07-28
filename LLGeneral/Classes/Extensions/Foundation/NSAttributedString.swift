//
//  NSAttributedString.swift
//  LLGeneral
//
//  Created by ZHK on 2021/7/28.
//  
//

import Foundation

extension NSAttributedString {
    
    /// 从 RTF 文件加载富文本
    /// - Parameter path: 文件路径
    /// - Throws:  异常信息
    /// - Returns: 富文本对象
    static func fromRTF(path: String) throws -> NSAttributedString? {
        try fromRTF(url: URL(fileURLWithPath: path))
    }
    
    /// 从 RTF 文件加载富文本
    /// - Parameter url: 文件 URL
    /// - Throws:  异常信息
    /// - Returns: 富文本对象
    static func fromRTF(url: URL) throws -> NSAttributedString {
        try NSAttributedString(url: url, options: [
            NSAttributedString.DocumentReadingOptionKey.documentType : NSAttributedString.DocumentType.rtf
        ], documentAttributes: nil)
    }
}
