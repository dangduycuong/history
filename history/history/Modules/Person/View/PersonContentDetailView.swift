//
//  PersonContentDetailView.swift
//  history
//
//  Created by cuongdd on 28/02/2024.
//

import UIKit

class PersonContentDetailView: UIView {
    // Add any custom properties
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .fill
        stackView.distribution = .fill
        
        return stackView
    }()
    
    private lazy var nameTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.boldSystemFont(ofSize: 21)
        textView.isScrollEnabled = false
        textView.delegate = self
        return textView
    }()
    
    private lazy var urlTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 21)
        textView.isScrollEnabled = false
        textView.delegate = self
        return textView
    }()
    
    lazy var saveButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(saveButtonClicked), for: .touchUpInside)
        button.layer.cornerRadius = 4
        button.backgroundColor = UIColor.blue
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 21)
        button.setTitle("Lưu Lại", for: .normal)
        return button
    }()
    
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(cancelButtonClicked), for: .touchUpInside)
        button.layer.cornerRadius = 4
        button.backgroundColor = UIColor.blue.withAlphaComponent(0.4)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 21)
        button.setTitle("Đóng", for: .normal)
        return button
    }()
    
    private lazy var containerButtonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    private lazy var namePlaceholderLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var urlPlaceholderLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    var saveOption: ((_ index: Int, _ name: String?, _ url: String?) -> Void) = { (_, _, _) in }
    var index: Int = 0
    
    // Override the initializer methods as needed
    override init(frame: CGRect) {
        super.init(frame: frame)
        // Custom initialization code
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // Custom initialization code
        setupView()
    }
    
    // Setup view properties or add subviews here
    private func setupView() {
        contentStackView.removeFromSuperview()
        contentStackView.subviews.forEach { view in
            view.removeFromSuperview()
        }
        self.layout(contentStackView)
            .top(8)
            .left(8)
            .right(8)
        
        contentStackView.addArrangedSubview(nameTextView)
        contentStackView.addArrangedSubview(urlTextView)
        
        self.layout(containerButtonStackView)
            .below(contentStackView, 32)
            .left(32)
            .right(32)
            .height(40)
            .bottom(16)
        
        containerButtonStackView.addArrangedSubview(cancelButton)
        containerButtonStackView.addArrangedSubview(saveButton)
        
        setupPlaceholder(label: namePlaceholderLabel, textView: nameTextView, title: "Nhập tên...")
        setupPlaceholder(label: urlPlaceholderLabel, textView: urlTextView, title: "Nhập url...")
    }
    
    private func setupPlaceholder(label: UILabel, textView: UITextView, title: String) {
        label.text = title
        label.font = UIFont.italicSystemFont(ofSize: 21)
        label.sizeToFit()
        textView.addSubview(label)
        
        label.frame.origin = CGPoint(x: 5, y: (textView.font?.pointSize)! / 2)
        label.textColor = UIColor.gray
        label.isHidden = !textView.text.isEmpty
    }
    
    // Override draw method for custom drawing (if needed)
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        // Custom drawing code
    }
    
    func fillData(name: String?, url: String?, index: Int) {
        nameTextView.text = name
        urlTextView.text = url
        self.index = index
    }
    
    @objc func saveButtonClicked(_ sender: UIButton) {
        self.endEditing(true)
        self.isHidden = true
        saveOption(index, nameTextView.text, urlTextView.text)
    }
    
    @objc func cancelButtonClicked(_ sender: UIButton) {
        self.endEditing(true)
        self.isHidden = true
    }
}

extension PersonContentDetailView: UITextViewDelegate {
    func textViewDidChangeSelection(_ textView: UITextView) {
        if textView == nameTextView {
            namePlaceholderLabel.isHidden = !textView.text.isEmpty
        }
        
        if textView == urlTextView {
            urlPlaceholderLabel.isHidden = !textView.text.isEmpty
        }
    }
}
