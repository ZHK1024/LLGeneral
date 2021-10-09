//
//  LLDirectory.swift
//  LLGeneral
//
//  Created by ZHK on 2021/10/9.
//  
//

import Foundation

/// 文件目录
public enum LLDirectory {
    
    case documents
    case library
    case tmp
    case mainBundle
    
    var path: String {
        switch self {
        case .documents:
            return NSHomeDirectory() + "/Documents"
        case .library:
            return NSHomeDirectory() + "/Library"
        case .tmp:
            return NSHomeDirectory() + "/tmp"
        case .mainBundle:
            return Bundle.main.bundlePath
        }
    }
}
