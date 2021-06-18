//
//  LLPrivacyPolicyTextView.swift
//  LLGeneral
//
//  Created by ZHK on 2021/6/17.
//  
//

import UIKit

class LLPrivacyPolicyTextView: LLPrivacyPolicyBaseView {
    
    private let textView = UITextView()
    
    // MARK: Init
    
    init(_ string: String, modifer: LLPrivacyPolicyModifier? = nil) {
        super.init(modifer: modifer)
        textView.text = string
        setupUI()
    }
    
    init(attributed string: NSAttributedString, modifer: LLPrivacyPolicyModifier? = nil) {
        super.init(modifer: modifer)
        textView.attributedText = string
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: UI
    
    private func setupUI() {
        textView.isEditable = false
        textView.backgroundColor = UIColor.rgb(0xf9, 0xf9, 0xf9)
        textView.contentInset = modifer.contentInsets
        textView.layer.cornerRadius = 5.0
        textView.font = modifer.contentFont
        addSubview(textView)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let detal = titleSpace
        textView.frame = CGRect(x: modifer.backgroundInsets.left,
                                y: modifer.backgroundInsets.top + detal,
                                width: bounds.width - modifer.backgroundInsets.shSpacing,
                                height: bounds.height - modifer.backgroundInsets.svSpacing - modifer.buttonHeight - detal)
    }
}
