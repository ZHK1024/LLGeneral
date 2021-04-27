//
//  UIImage.swift
//  ZHKSwiftExtension
//
//  Created by ZHK on 2021/2/23.
//  
//

import UIKit


extension UIImage {

    public func zip(with size: Int) -> Data {
        var compression: CGFloat = 0.9
        var data = jpegData(compressionQuality: compression)!
        while data.count > size {
            compression *= compression
            autoreleasepool {
                data = jpegData(compressionQuality: compression)!
            }
        }
        return data
    }
    
//    func <#name#>(<#parameters#>) -> <#return type#> {
//        <#function body#>
//    }
}
