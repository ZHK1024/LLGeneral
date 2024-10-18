//
//  LLPrivacyPolicyView.swift
//  LLGeneral
//
//  Created by ZHK on 2021/6/17.
//  
//

import UIKit
//import LLObject

public protocol LLPrivacyPolicyView: UIView {
    
    var callback: LLPrivacyPolicy.LLPrivacyPolicyRequestResult? { get set }
    
}

extension LLPrivacyPolicyView {
    
    /// 用于防止 window 对象被释放
    var windowHolder: UIWindow? {
        set {
            ll_KVMap["4FD61589A7D1631D"] = newValue
        }
        get {
            ll_KVMap["4FD61589A7D1631D"] as? UIWindow
        }
    }
    
    /// 页面消失
    public func dismiss() {
        UIView.animate(withDuration: 0.3) {
            self.windowHolder?.alpha = 0.0
            self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        } completion: { _ in
            self.windowHolder?.resignKey()
            self.windowHolder = nil
        }
    }
}
