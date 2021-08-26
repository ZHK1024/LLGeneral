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
    
    /// 获取二维码文本信息
    /// - Returns: 文本信息
    func QRCodeMessage() -> String? {
        // 1. 创建上下文
        let context = CIContext()
        // 2. 创建一个探测器
        let detector = CIDetector(ofType: CIDetectorTypeQRCode, context: context, options: [
            CIDetectorAccuracy : CIDetectorAccuracyLow
        ])
        // 3. 识别图片,获取图片特征
        let feature = detector?.features(in: self).first as? CIQRCodeFeature
        return feature?.messageString
    }
    
    /// 创建二维码图片
    /// - Parameter data: 二进制数据
    /// - Returns: CIImage 对象
    static func ciimage(data: Data) -> CIImage? {
        // 创建过滤器
        guard let filter = CIFilter(name: "CIQRCodeGenerator") else { return nil }
        filter.setDefaults()
        filter.setValue(data, forKey: "inputMessage")
        return filter.outputImage
    }
}
