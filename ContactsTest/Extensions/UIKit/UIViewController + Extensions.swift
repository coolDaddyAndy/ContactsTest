//
//  UIViewController + Extensions.swift
//  ContactsTest
//
//  Created by Andrei Sushkou on 3.04.23.
//

import UIKit

extension UIViewController {
   
    func presentSimpleAlert(title: String, message: String?) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}
