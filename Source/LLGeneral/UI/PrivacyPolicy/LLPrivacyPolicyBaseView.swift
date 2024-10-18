//
//  LLPrivacyPolicyBaseView.swift
//  LLGeneral
//
//  Created by ZHK on 2021/6/17.
//  
//

import UIKit

class LLPrivacyPolicyBaseView: UIView, LLPrivacyPolicyView {
    
    /// 结果回调
    public var callback: LLPrivacyPolicy.LLPrivacyPolicyRequestResult?
    
    /// 标题
    let titleLabel = UILabel()
    
    /// 同意按钮
    private let agreeButton = UIButton(type: .system)
    
    /// 拒绝按钮
    private let rejectButton = UIButton(type: .system)
    
    /// 按钮分割线
    private let separator: CALayer = {
        let layer = CALayer()
        layer.backgroundColor = UIColor.rgb(0xE4, 0xE4, 0xE4).cgColor
        return layer
    }()
    
    /// 按钮布局视图
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.spacing = 1.0
        view.backgroundColor = UIColor.rgb(0xE4, 0xE4, 0xE4)
        return view
    }()
    
    private let effectView: UIVisualEffectView = {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        return view
    }()
    
    /// 修饰器对象
    var modifer: LLPrivacyPolicyModifier
    
    // MARK: Init

    init(modifer: LLPrivacyPolicyModifier? = nil) {
        self.modifer = modifer ?? LLPrivacyPolicyModifier()
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        frame = CGRect(origin: .zero, size: modifer.size)
        backgroundColor = modifer.backgroundColor
        layer.cornerRadius = 5.0
        clipsToBounds = true
        
        /// 标题
        if let title = modifer.title {
            addSubview(titleLabel)
            titleLabel.attributedText = title
            titleLabel.sizeToFit()
        }
        
        addSubview(stackView)
        layer.addSublayer(separator)
        
        stackView.addArrangedSubview(rejectButton)
        stackView.addArrangedSubview(agreeButton)
        
        rejectButton.backgroundColor = .white
        agreeButton.backgroundColor = .white
        
        rejectButton.addTarget(self, action: #selector(reject), for: .touchUpInside)
        agreeButton.addTarget(self, action: #selector(agree), for: .touchUpInside)
        
        modifer.agreeTitleText.forEach {
            self.agreeButton.setAttributedTitle($1, for: UIControl.State(rawValue: $0))
        }
        
        modifer.rejectTitleText.forEach {
            self.rejectButton.setAttributedTitle($1, for: UIControl.State(rawValue: $0))
        }
        
        bringSubviewToFront(titleLabel)
    }
    
    /// 标题占用的空间
    public var titleSpace: CGFloat {
        if modifer.title == nil { return 0.0 }
        return titleLabel.bounds.height + modifer.titleContentInsets.svSpacing
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel.frame = CGRect(x: max(modifer.titleContentInsets.left, (bounds.width - titleLabel.bounds.width) / 2),
                                  y: modifer.titleContentInsets.top,
                                  width: titleLabel.bounds.width.clamp(0.0...(bounds.width - modifer.titleContentInsets.shSpacing)),
                                  height: titleLabel.bounds.height)
        
        effectView.frame = bounds
        stackView.frame = CGRect(x: 0.0,
                                 y: bounds.height - modifer.buttonHeight,
                                 width: bounds.width.flat,
                                 height: modifer.buttonHeight)
        separator.frame = CGRect(x: 0,
                                 y: stackView.frame.y - 1.0,
                                 width: bounds.width,
                                 height: 1.0)
    }
    
    // MARK: Action
    
    @objc private func agree() {
        dismiss()
        LLPrivacyPolicy.authorizationStatus = .agree
        callback?(.agree)
    }
    
    @objc private func reject() {
        dismiss()
        LLPrivacyPolicy.authorizationStatus = .reject
        callback?(.reject)
    }
}
