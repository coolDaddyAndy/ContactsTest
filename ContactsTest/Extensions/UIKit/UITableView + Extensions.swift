//
//  UITableView + Extensions.swift
//  ContactsTest
//
//  Created by Andrei Sushkou on 4.04.23.
//

import UIKit

extension UITableView {
    
    func register(_ type: UITableViewCell.Type) {
        let className = String(describing: type)
        register(type, forCellReuseIdentifier: className)
    }
    
    func dequeueReusableCell<T>(_ type: T.Type) -> T? {
        let className = String(describing: type)
        return dequeueReusableCell(withIdentifier: className) as? T
    }
}
