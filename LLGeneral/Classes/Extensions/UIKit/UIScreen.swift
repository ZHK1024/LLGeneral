//
//  UIScreen.swift
//  ZHKSwiftExtension
//
//  Created by ZHK on 2018/8/20.
//  Copyright © 2018年 ZHK. All rights reserved.
//

import UIKit

extension UIScreen {
    
    public static var width: CGFloat { size.width }

    public static var height: CGFloat { size.height }

    public static var size: CGSize { main.bounds.size }
}
