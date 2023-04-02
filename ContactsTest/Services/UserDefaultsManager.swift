//
//  UserDefaultsManager.swift
//  ContactsTest
//
//  Created by Andrei Sushkou on 2.04.23.
//

import Foundation

final class UserDefaultsManager {
    
    private static let defaults = UserDefaults.standard
    private static let userSessionKey: String = "userKey"
    
    static func getUserDictionary() -> [String : String] {
        defaults.value(forKey: userSessionKey) as? [String : String] ?? [:]
    }
    
    static func saveUserValue(_ key: String,_ value: String) {
        var userDictionary = getUserDictionary()
        userDictionary[key] = value
        defaults.set(userDictionary, forKey: userSessionKey)
    }
    
    static func getUserModel() -> UserModel {
        var usereModel = UserModel()
        let userDictionary = getUserDictionary()
        usereModel.firstName = userDictionary[Resources.NameFields.firstName.rawValue] ?? ""
        usereModel.lastName = userDictionary[Resources.NameFields.lastName.rawValue] ?? ""
        usereModel.birthday = userDictionary[Resources.NameFields.birthday.rawValue] ?? ""
        usereModel.gender = userDictionary[Resources.NameFields.gender.rawValue] ?? ""
        return usereModel
    }
    
    static func getUserValue(_ key: String) -> String {
        let userDictionary = getUserDictionary()
        let stringValue = userDictionary[key] ?? ""
        return stringValue
    }
}
