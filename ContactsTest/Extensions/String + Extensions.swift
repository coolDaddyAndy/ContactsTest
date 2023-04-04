//
//  String + Extensions.swift
//  ContactsTest
//
//  Created by Andrei Sushkou on 4.04.23.
//

import Foundation


extension String {
    
    func getDateFromString() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.mm.yyyy"
        let date = dateFormatter.date(from: self) ?? Date()
        return date
    }
}
