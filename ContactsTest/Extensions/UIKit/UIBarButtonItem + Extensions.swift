//
//  UIBarButtonItem + Extensions.swift
//  ContactsTest
//
//  Created by Andrei Sushkou on 3.04.23.
//

import UIKit

extension UIBarButtonItem {
    
    static func createCustomButton(viewController: UIViewController, selector: Selector) -> UIBarButtonItem {
        let button = UIButton(type: .system)
        button.setTitle("Back", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17)
        button.tintColor = .systemBlue
        button.addTarget(viewController, action: selector, for: .touchUpInside)
        
        let barItem = UIBarButtonItem(customView: button)
        return barItem
    }
}
