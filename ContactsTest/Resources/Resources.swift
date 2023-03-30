//
//  Resources.swift
//  ContactsTest
//
//  Created by Andrei Sushkou on 21.03.23.
//

import UIKit

enum Resources {
    
    enum NameFields: String, CaseIterable {
        case firstName = "First name"
        case lastName  = "Last name"
        case gender    = "Gender"
        case birthday  = "Birthday"
    }
    
    enum Fonts {
        static func helveticaNeue (size: CGFloat) -> UIFont? {
            return UIFont(name: "Helvetica Neue", size: size)
        }
    }
}
