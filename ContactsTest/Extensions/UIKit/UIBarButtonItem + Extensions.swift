//
//  UIBarButtonItem + Extensions.swift
//  ContactsTest
//
//  Created by Andrei Sushkou on 3.04.23.
//

import UIKit

extension UIBarButtonItem {
    
    static func createCustomButton(selector: Selector) -> UIBarButtonItem {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "back")?.withRenderingMode(.automatic),
                        for: .normal)
        button.setTitle("Back", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17)
        button.tintColor = .systemBlue
        button.addTarget(self, action: selector, for: .touchUpInside)
        
        let barItem = UIBarButtonItem(customView: button)
        return barItem
    }
}
