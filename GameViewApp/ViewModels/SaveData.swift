//
//  SaveData.swift
//  GameViewApp
//
//  Created by Miguel Rios on 14/6/22.
//

import Foundation

class SaveData {
    var email: String = ""
    var pass: String = ""
    var name: String = ""
    
    func saveUserData( email: String, pass: String, name: String ) -> Bool {
        print("Current data: \(email) \(pass) \(name)")
        UserDefaults.standard.set([email, pass, name], forKey: "userData")
        return true
    }
    
    func getUserData() -> [String] {
        let userData: [String] = UserDefaults.standard.stringArray(forKey: "userData")!
        print("User data: \(userData)")
        return userData
    }
    
    func validateUserData(email: String, pass: String) -> Bool {
        var currentEmail = ""
        var currentPass = ""
        print("Current data for \(email)")
        
        if (UserDefaults.standard.object(forKey: "userData") != nil ) {
            currentEmail = UserDefaults.standard.stringArray(forKey: "userData")![0]
            currentPass = UserDefaults.standard.stringArray(forKey: "userData")![1]
            print("Current user: \(email)")
            if ( email == currentEmail && pass == currentPass ) {
                return true
            }
        } else {
            print("User not found")
            return false
        }
        
        return false
    }
}
