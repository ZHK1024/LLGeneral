//
//  LLPrivacyPolicyModifier.swift
//  LLGeneral
//
//  Created by ZHK on 2021/6/17.
//  
//

import UIKit

public class LLPrivacyPolicyModifier: NSObject {

    // MARK: View
    
    /// 背景视图尺寸大小
    public var size: CGSize = CGSize(width: .screenWidth * 0.9, height: .screenHeight * 0.7)
    
    /// 背景颜色
    public var backgroundColor: UIColor = .white
    
    /// 背景圆角
    public var cornerRadius: CGFloat = 5.0
    
    /// 背景边距
    public var backgroundInsets: UIEdgeInsets = UIEdgeInsets(top: 20.0, left: 15.0, bottom: 20.0, right: 15.0)
    
    // MARK: Title
    
    /// 顶部标题
    public var title: NSAttributedString?
    
    /// 标题边距
    public var titleContentInsets: UIEdgeInsets = UIEdgeInsets(top: 20.0, left: 15.0, bottom: 10.0, right: 15.0)
    
    // MARK: Content
    /// 文本字体
    public var contentFont: UIFont = .systemFont(ofSize: 13.0)
    
    /// 内容边距
    public var contentInsets: UIEdgeInsets = .all(5.0)
    
    // MARK: Button
    
    /// 同意按钮文本颜色
    public var agreeTitleText: [UIControl.State.RawValue : NSAttributedString] = [
        UIControl.State.normal.rawValue : NSAttributedString(string: "同意并继续", attributes: [.foregroundColor : UIColor.black])
    ]
    
    /// 拒绝按钮文本颜色
    public var rejectTitleText: [UIControl.State.RawValue : NSAttributedString] = [
        UIControl.State.normal.rawValue : NSAttributedString(string: "不同意", attributes: [.foregroundColor : UIColor.gray])
    ]
    
    /// 底部按钮高度
    public var buttonHeight: CGFloat = 50.0
}
