//
//  UITextField.swift
//  LLGeneral
//
//  Created by ZHK on 2021/7/29.
//  
//

import UIKit

extension UITextField {
    
    /// 选中全部文本 (UITextField 未进入编辑状态时候不太起作用)
    public func selectAllText() {
        guard let start = position(from: beginningOfDocument, offset: 0),
              let end = position(from: endOfDocument, offset: 0) else {
            return
        }
        selectedTextRange = textRange(from: start, to: end)
    }
}
