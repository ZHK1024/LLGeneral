//
//  File.swift
//  LLGeneral
//
//  Created by ZHK on 2021/6/16.
//  
//

import Foundation

public struct File {}


extension File {
    
    /// 在指定目录下查找文件
    /// - Parameters:
    ///   - path:     文件夹路径
    ///   - fileName: 查找文件名
    /// - Returns: 文件完整路径
    public static func findFile(at path: String, fileName: String) -> String? {
        /// 判断文件是否存在, 并且是文件夹
        var isDirectory: ObjCBool = false
        guard FileManager.default.fileExists(atPath: path, isDirectory: &isDirectory),
              isDirectory.boolValue else {
            return nil
        }
        /// 获取当前文件夹下所有文件
        guard let files = try? FileManager.default.contentsOfDirectory(atPath: path) else {
            return nil
        }
        /// 当前文件夹下是否包含指定 name 的文件
        if files.contains(fileName) {
            return (path as NSString).appendingPathComponent(fileName)
        }
        /// 往下级目录遍历
        /// component 为包含 name 文件的文件夹, 都没包含则为 nil
        if let component = files.first(where: { findFile(at: path + "/\($0)", fileName: fileName) != nil }) {
            return (path as NSString).appendingPathComponent("\(component)/\(fileName)")
        }
        return nil
    }
    
    /// 移动文件 (如果有重名, 则在文件名后添加 `-序号` 来生成新的文件名)
    /// - Parameters:
    ///   - file: 目标文件
    ///   - to:   目标地址
    /// - Throws: 错误信息
    /// - Returns: 移动后文件地址
    public static func move(file: URL, to: URL) throws -> URL {
        guard FileManager.default.fileExists(atPath: file.path) else {
            throw NSError(domain: "com.zhk.error", code: 0, userInfo: [
                NSLocalizedDescriptionKey : NSLocalizedString("File Not Exist", comment: "File Not Exist")
            ])
        }
        var resultURL = to
        var tag = 1
        while FileManager.default.fileExists(atPath: to.path) == false {
            resultURL = resultURL.deletingPathExtension().appendingPathComponent("-\(tag)" + resultURL.pathExtension)
            tag += 1
        }
        return resultURL
    }
}
