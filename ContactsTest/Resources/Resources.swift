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
        case birthday  = "Birthday"
        case gender    = "Gender"
        
    }
    
    enum Fonts {
        static func helveticaNeue (size: CGFloat) -> UIFont? {
            return UIFont(name: "Helvetica Neue", size: size)
        }
    }
    
    enum Gender: String, CaseIterable {
        case noSpecified = "No specified"
        case male = "He/him"
        case female = "She/her"
    }
}
