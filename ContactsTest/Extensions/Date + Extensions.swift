//
//  Date + Extensions.swift
//  ContactsTest
//
//  Created by Andrei Sushkou on 4.04.23.
//

import Foundation

extension Date {
    
    func getStringFromDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.mm.yyyy"
        let dateString = dateFormatter.string(from: self)
        return dateString
    }
}
