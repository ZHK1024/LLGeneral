//
//  CIImage.swift
//  ZHKSwiftExtension
//
//  Created by ZHK on 2021/2/23.
//  
//

import CoreImage

public extension CIImage {
    
    /// 创建高清 UIImage 对象
    /// - Parameter size: 缩放后的尺寸
    /// - Returns: UIImage 对象
    func uiimage(size: CGSize? = nil) -> UIImage {
        let newSize = size ?? extent.size
        let scale = CGPoint(x: newSize.width / extent.width, y: newSize.height / extent.height)
        /// Create bitmap
        let cs = CGColorSpaceCreateDeviceGray()
        /// 去处 Alpha 通道 CGImageAlphaInfo.noneSkipLast
        let bitmap = CGContext(data: nil,
                               width: size_t(newSize.width),
                               height: size_t(newSize.height),
                               bitsPerComponent: 8,
                               bytesPerRow: 0,
                               space: cs,
                               bitmapInfo: CGImageAlphaInfo.noneSkipLast.rawValue)!
        
        let context = CIContext()
        let bitmapImage = context.createCGImage(self, from: extent)
        bitmap.interpolationQuality = .none
        bitmap.scaleBy(x: scale.x, y: scale.y)
        bitmap.draw(bitmapImage!, in: extent)
            
        let scaledImage = bitmap.makeImage()
        return UIImage.init(cgImage: scaledImage!)
    }
}
