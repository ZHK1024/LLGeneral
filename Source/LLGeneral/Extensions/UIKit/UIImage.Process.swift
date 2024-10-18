//
//  UIImage.swift
//  ZHKSwiftExtension
//
//  Created by ZHK on 2021/2/23.
//  
//

import UIKit

public extension UIImage {
    
    /// 压缩图片 (压缩质量)
    /// - Parameter limitSize: 限制尺寸
    /// - Returns: 压缩结果数据
    func zip(with limitSize: Int) -> Data {
        var compression: CGFloat = 0.9
        var data = jpegData(compressionQuality: compression)!
        while data.count > limitSize {
            compression *= compression
            autoreleasepool {
                data = jpegData(compressionQuality: compression)!
            }
        }
        return data
    }
    
    /// 获取二维码信息
    /// - Returns: 二维码文本
    func QRCodeString() -> String? {
        guard let cgi = cgImage else { return nil }
        return CIImage(cgImage: cgi).QRCodeMessage()
    }
    
    /// 创建二维码图片
    /// - Parameter message: 文本信息
    convenience init?(message: String) {
        guard let data = message.data(using: .utf8) else { return nil }
        self.init(qrData: data)
    }
    
    /// 创建二维码图片
    /// - Parameter qrData: 二维码数据
    convenience init?(qrData: Data) {
        guard let ciimg = CIImage.ciimage(data: qrData) else { return nil }
        self.init(ciImage: ciimg)
    }
}
