//
//  PrivacyPolicy.swift
//  LLGeneral
//
//  Created by ZHK on 2021/6/17.
//  
//

import UIKit
import MapKit
import AdSupport
import AppTrackingTransparency

/// 隐私政策
public struct LLPrivacyPolicy {
    
    public typealias LLPrivacyPolicyRequestResult = (AuthorizationStatus) -> Void
    
    /// 权限请求状态
    public static var authorizationStatus: AuthorizationStatus {
        set {
            UserDefaults.standard.setValue(newValue.rawValue, forKey: "D459089612238A5E")
            UserDefaults.standard.synchronize()
        }
        get {
            guard let rawValue = UserDefaults.standard.value(forKey: "D459089612238A5E") as? Int else {
                return .unknown
            }
            return AuthorizationStatus(rawValue: rawValue) ?? .unknown
        }
    }
    
    /// 重置权限状态 (如果有重新发起授权需求的需求话)
    public static func resetAuthorizationStatus() {
        authorizationStatus = .unknown
    }
    
    /// 请求权限
    /// - Parameters:
    ///   - policy:   隐私政策文本
    ///   - complete: 请求回调
    public static func requestAuthorization(policy: String, modifier: LLPrivacyPolicyModifier? = nil, complete: @escaping LLPrivacyPolicyRequestResult) {
        requestAuthorization(view: LLPrivacyPolicyTextView(policy, modifer: modifier), complete: complete)
    }
    
    /// 请求权限
    /// - Parameters:
    ///   - policy:   隐私政策文本
    ///   - complete: 请求回调
    public static func requestAuthorization(policy: NSAttributedString, modifier: LLPrivacyPolicyModifier? = nil, complete: @escaping LLPrivacyPolicyRequestResult) {
        requestAuthorization(view: LLPrivacyPolicyTextView(attributed: policy, modifer: modifier), complete: complete)
    }
    
    public static func requestAuthorization(policyURL: URL, modifier: LLPrivacyPolicyModifier? = nil, complete: @escaping LLPrivacyPolicyRequestResult) {
        requestAuthorization(view: LLPrivacyPolicyWebView(url: policyURL, modifer: modifier), complete: complete)
    }
    
    /// 请求权限
    /// - Parameter complete: 回调
    public static func requestAuthorization<T: LLPrivacyPolicyView>(view: T, complete: @escaping LLPrivacyPolicyRequestResult) {
        /// 如果已经询问过, 则不再提示
        guard authorizationStatus == .unknown else { return }

        /// 异步执行!!!
        /// 在 app 未初始化完成时候同步执行会报如下错误, 因此在 app 完全初始化完成之后再新建 UIWindow 对象.
        /// `*** Terminating app due to uncaught exception 'NSInternalInconsistencyException', reason: 'Application windows are expected to have a root view controller at the end of application launch'`
        DispatchQueue.main.async {
            /// UIWindow
            let window = UIWindow(frame: UIScreen.main.bounds)
            window.windowLevel = .alert
            window.makeKeyAndVisible()
            window.backgroundColor = UIColor.black.withAlphaComponent(0.1)
            window.isOpaque = false
            
            /// 添加视图
            window.addSubview(view)
            view.center = window.center
            view.callback = complete
            view.windowHolder = window
        }
    }
    
    /// 授权状态
    public enum AuthorizationStatus: Int {
        case unknown    /// 未授权状态
        case agree      /// 同意授权
        case reject     /// 拒绝授权
    }
}
