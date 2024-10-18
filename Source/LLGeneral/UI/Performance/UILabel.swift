//
//  UILabel.swift
//  LLUIPerformance
//
//  Created by ZHK on 2021/2/26.
//  
//

import UIKit


public extension UILabel {
    
    /// 优化 UILabel
    /// - Parameter backgroundColor: 背景颜色 (默认白色)
    func optimize(_ backgroundColor: UIColor = .white) {
        self.backgroundColor = backgroundColor
        clipsToBounds = true
    }
}
