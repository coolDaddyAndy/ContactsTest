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
    
    func presentChangesAlert(completionHandler: @escaping (Bool) -> Void) {
        let alertController = UIAlertController(title: "Fields were changed",
                                                message: "You would like to save changes, otherwise all the changes would dismiss",
                                                preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Cancel", style: .destructive) { _ in
            completionHandler(false)
        }
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            completionHandler(true)
        }
        alertController.addAction(dismissAction)
        alertController.addAction(saveAction)
        present(alertController, animated: true)
    }
}
