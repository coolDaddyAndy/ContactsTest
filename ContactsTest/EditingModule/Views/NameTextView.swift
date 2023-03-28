//
//  NameTextView.swift
//  ContactsTest
//
//  Created by Andrei Sushkou on 28.03.23.
//

import UIKit

final class NameTextView: UITextView {
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        text = "Add some text"
        textColor = .lightGray
        textAlignment = .right
        isScrollEnabled = false
    }
}
