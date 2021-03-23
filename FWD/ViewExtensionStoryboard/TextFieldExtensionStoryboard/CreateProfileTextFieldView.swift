//
//  CreateProfileTextFieldView.swift
//  topspot
//
//  Created by Łukasz Haraźny on 27/09/16.
//  Copyright © 2016 DKA. All rights reserved.
//

import UIKit

/// Input text field view
@IBDesignable class CreateProfileTextFieldView: UIView {
    
    @IBOutlet weak var constWidthNextImage: NSLayoutConstraint!  //16
    @IBOutlet weak var btnNext: UIImageView!
    @IBOutlet weak var btnInstagram: UIImageView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var validIndicatorImageView: UIImageView!
    weak var delegate: CreateProfileTextFieldViewDelegate?
    var isInstaImage = false
    var isNextButton = false
    
    @IBOutlet weak var constWidthFronImage: NSLayoutConstraint!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        guard let mainView = viewFromXib else {
            return nil
        }
     //   specialCharacterTextField.isUserInteractionEnabled = false
        setUp(for: mainView)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        guard let mainView = viewFromXib else {
            return
        }
  //      specialCharacterTextField.isUserInteractionEnabled = false
        setUp(for: mainView)
    }
    
    override var accessibilityIdentifier: String? {
        set {
            textField.accessibilityIdentifier = newValue
        }
        get {
            return textField.accessibilityIdentifier
        }
    }
    
    // MARK: - IBInspectable properties
   
    @IBInspectable var text: String? {
        get {
            return textField.text
        }
        set {
            textField.text = newValue
        }
    }
    
    @IBInspectable var textColor: UIColor? {
        get {
            return textField.textColor
        }
        set {
            textField.textColor = newValue
            textField.tintColor = newValue
        }
    }
    
    
    
   
    
    
    
    // MARK: - Other properties
    var keyboardType: UIKeyboardType {
        get {
            return textField.keyboardType
        }
        set {
            textField.keyboardType = newValue
        }
    }
    
    var returnKeyType: UIReturnKeyType {
        get {
            return textField.returnKeyType
        }
        set {
            textField.returnKeyType = newValue
        }
    }
    
    var isSecure: Bool {
        get {
            return textField.isSecureTextEntry
        }
        set {
            textField.isSecureTextEntry = newValue
        }
    }
 
    var isShowFronImage: Bool {
        get {
            return self.constWidthFronImage.constant > 0.0
        }
        set {
            self.constWidthFronImage.constant = newValue == true ? 20 : 0
        }
    }
    
    
    var isSelectedView: Bool {
        get {
            return (self.validIndicatorImageView.image != nil)
        }
        set {
            self.validIndicatorImageView.image = newValue == true ? UIImage(named: "TextFieldRectangle") : UIImage(named: "gray_border_rectangle")
        }
    }
    
    
    
    
    var isShowNextArrowImage: Bool {
        get {
            return self.constWidthNextImage.constant > 0.0
        }
        set {
            self.constWidthNextImage.constant = newValue == true ? 24 : 0
        }
    }
    
    
   
    override func becomeFirstResponder() -> Bool {
        return textField.becomeFirstResponder()
    }
    
    override func resignFirstResponder() -> Bool {
        return textField.resignFirstResponder()
    }
    
//    var reactive: Reactive<UITextField> {
//        return textField.reactive
//    }
//    
//    func emitChangeEvent() {
//        textField.emitChangeEvent()
//    }
}

// MARK: - Set up
 extension CreateProfileTextFieldView {
    func setUp(for mainView: UIView) {
        addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        let top = NSLayoutConstraint.init(item: mainView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0)
        let leadind = NSLayoutConstraint.init(item: mainView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0)
        let trailing = NSLayoutConstraint.init(item: mainView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0)
        let bottom = NSLayoutConstraint.init(item: mainView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([top,leadind,trailing,bottom])
        
        backgroundColor = .clear
        textField.delegate = self
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
        returnKeyType = .next
        isShowFronImage = false
    }
    
    func setAttributedPlaceholder(for text: String?, color: UIColor?) {
        guard let text = text else {
            textField.attributedPlaceholder = nil
            textField.placeholder = nil
            
            return
        }
        
        textField.attributedPlaceholder = NSAttributedString(string: text,
                                                             attributes: [NSAttributedString.Key.foregroundColor: color ?? UIColor.black])
    }
}

// MARK: - Xib
private extension CreateProfileTextFieldView {
    var viewFromXib: UIView? {
        let bundle = Bundle(for: type(of: self))
        guard let mainObject = UINib(nibName: "CreateProfileTextFieldView", bundle: bundle).instantiate(withOwner: self, options: nil).first else {
            return nil
        }
        
        return mainObject as? UIView
    }
}

// MARK: - UITextFieldDelegate
extension CreateProfileTextFieldView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
       
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return delegate?.shouldReturn(CreateProfileTextFieldView: self) ?? true
    }
}
