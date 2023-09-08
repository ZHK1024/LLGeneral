//
//  UIImage.Init.swift
//  LLGeneral
//
//  Created by ZHK on 2023/9/8.
//  
//

import UIKit

extension UIImage {
    
    @available(iOS 13, *)
    /// 创建细线条的图片
    /// - Parameter systemName: 系统图片名称
    /// - Returns: 图片对象
    public static func regular(systemName: String) -> UIImage? {
        let config = UIImage.SymbolConfiguration(weight: .regular)
        return UIImage(systemName: systemName, withConfiguration: config)
    }

    @available(iOS 13, *)
    /// 创建细线条的图片
    /// - Parameter name: 本地图片集合名称 (SFSymbol 导出的 svg 模板名称)
    /// - Returns: 图片对象
    public static func regular(name: String) -> UIImage? {
        let config = UIImage.SymbolConfiguration(weight: .regular)
        return UIImage(named: name, in: nil, with: config)
    }
    
    @available(iOS 13, *)
    /// 创建图片对象
    /// - Parameters:
    ///   - name: 文件名
    ///   - weight: 图片线条宽度
    /// - Returns: 图片对象
    public static func image(name: String, weight: UIImage.SymbolWeight = .regular) -> UIImage? {
        let config = UIImage.SymbolConfiguration(weight: weight)
        return UIImage(named: name, in: nil, with: config)
    }
    
    @available(iOS 13, *)
    /// 创建图片对象
    /// - Parameters:
    ///   - systemName: 系统图片名称
    ///   - weight: 图片线条宽度
    /// - Returns: 图片对象
    public static func image(systemName: String, weight: UIImage.SymbolWeight = .regular) -> UIImage? {
        let config = UIImage.SymbolConfiguration(weight: weight)
        return UIImage(systemName: systemName, withConfiguration: config)
    }
}
