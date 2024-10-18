//
//  NSData.swift
//  ZHKSwiftExtension
//
//  Created by ZHK on 2021/2/23.
//  
//

import UIKit
import CoreGraphics

public extension NSData {
    
    /// NSData 转换为二维码
    /// - Returns: 转换结果
    func QRCodeImage(size: CGFloat? = nil) -> UIImage? {
        guard let filter = CIFilter(name: "CIQRCodeGenerator") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(self, forKey: "inputMessage")
        filter.setValue("H", forKey: "inputCorrectionLevel")
        if let width = size {
            return filter.outputImage?.uiimage(size: CGSize.all(width))
        } else {
            return filter.outputImage?.uiimage()
        }
    }
}

public extension Data {
    
    /// NSData 转换为二维码
    /// - Returns: 转换结果
    func QRCodeImage(size: CGFloat? = nil) -> UIImage? {
        (self as NSData).QRCodeImage(size: size)
    }
}



