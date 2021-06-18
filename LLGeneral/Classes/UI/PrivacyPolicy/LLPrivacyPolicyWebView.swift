//
//  LLPrivacyPolicyWebView.swift
//  LLGeneral
//
//  Created by ZHK on 2021/6/17.
//  
//

import UIKit
import WebKit

class LLPrivacyPolicyWebView: LLPrivacyPolicyBaseView {
    
    /// WebView
    private let webView: WKWebView = {
        let config = WKWebViewConfiguration()
        return WKWebView(frame: .zero, configuration: config)
    }()

    // MARK: Init
    
    init(url: URL, modifer: LLPrivacyPolicyModifier? = nil) {
        super.init(modifer: modifer)
        setupUI()
        webView.load(URLRequest(url: url))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: UI
    
    private func setupUI() {
        addSubview(webView)
        webView.navigationDelegate = self
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let detal = titleSpace
        webView.frame = CGRect(x: modifer.backgroundInsets.left,
                               y: modifer.backgroundInsets.top + detal,
                               width: bounds.width - modifer.backgroundInsets.shSpacing,
                               height: bounds.height - modifer.backgroundInsets.svSpacing - modifer.buttonHeight - detal)
    }
}

extension LLPrivacyPolicyWebView: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        let js = "var meta = document.createElement('meta');meta.setAttribute('name', 'viewport');meta.setAttribute('content', 'width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no');document.getElementsByTagName('head')[0].appendChild(meta);";
        webView.evaluateJavaScript(js, completionHandler: nil)
    }
}
