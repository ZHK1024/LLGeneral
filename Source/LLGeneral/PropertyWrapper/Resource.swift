//
//  Resource.swift
//  LLGeneral
//
//  Created by ZHK on 2021/10/9.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation

/// 从指定目录读取 `Plist` 文件
@propertyWrapper
public class SourceDecodable<T: Decodable> {
    
    /// 存储值
    private var value: T
    
    /// 返回值
    public var wrappedValue: T { return value }
    
    /// 返回回调对象, 刷新数据
    public var projectedValue: LLPropertyWrapperExecute { refreshBlock }
    
    private lazy var refreshBlock = LLPropertyWrapperExecute { [weak self] in
        if let value = self?.readValueFromSource() ?? self?.defaultValue {
            self?.value = value
        }
    }
    
    let type: Type
    
    /// 文件存储目录
    let directory: LLDirectory
    
    /// 文件路径
    let path: String
    
    /// 默认值
    let defaultValue: T
    
    // MARK: - Init
    
    /// 初始化
    /// - Parameters:
    ///   - directory: 文件目录
    ///   - path:      文件路径
    ///   - default:   默认数据
    public init(_ type: `Type`, _ directory: LLDirectory, _ path: String, _ defaultValue: T) {
        self.type = type
        self.directory = directory
        self.path = path
        self.defaultValue = defaultValue
        self.value = defaultValue
        self.value = readValueFromSource()
    }
    
    // MARK: - Data
    
    /// 从文件读取数据
    /// - Returns: 读取结果
    private func readValueFromSource() -> T {
        do {
            let filePath = (directory.path as NSString).appendingPathComponent(path)
            let data = try Data(contentsOf: URL(fileURLWithPath: filePath))
            switch type {
            case .plist:
                return try PropertyListDecoder().decode(T.self, from: data)
            case .json:
                return try JSONDecoder().decode(T.self, from: data)
            }
        } catch {
            return defaultValue
        }
    }
}

extension SourceDecodable {
    
    public enum `Type` {
        case plist
        case json
    }
}

public struct LLPropertyWrapperExecute {
    
    private let execute: () -> Void
    
    init(execute: @escaping () -> Void) {
        self.execute = execute
    }
    
    public func reload() {
        execute()
    }
}
