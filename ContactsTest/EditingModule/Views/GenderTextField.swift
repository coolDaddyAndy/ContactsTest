//
//  GenderTextField.swift
//  ContactsTest
//
//  Created by Andrei Sushkou on 30.03.23.
//

import UIKit

final class GenderTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
//        placeholder = "Add gender"
        textAlignment = .right
        tintColor = .clear
        font = Resources.Fonts.helveticaNeue(size: 20)
        let placeholderFont = Resources.Fonts.helveticaNeue(size: 20)
        attributedPlaceholder = NSAttributedString(string: "Add gender",
                                                   attributes: [.foregroundColor : UIColor.lightGray,
                                                                .font : placeholderFont as Any])
    }
    
    override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        !isFirstResponder
    }
}
