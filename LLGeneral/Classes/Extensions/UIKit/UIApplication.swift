//
//  UIApplication.swift
//  Mew
//
//  Created by ZHK on 2023/6/21.
//  
//

import UIKit


extension UIApplication {
    
    /// 当前的 keyWindow
    public static var keyWindow: UIWindow? {
        UIApplication.shared.connectedScenes
            .compactMap { scene -> UIWindowScene? in
                scene as? UIWindowScene
            }
            .first { $0.activationState == .foregroundActive }
            .map {
                $0.windows.filter { $0.isKeyWindow }
            }?.first
    }
    
    /// keyWindow 的 rootViewController
    public static var rootViewController: UIViewController? {
        UIApplication.keyWindow?.rootViewController
    }
}
