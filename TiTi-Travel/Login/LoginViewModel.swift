//
//  LoginViewModel.swift
//  TiTi-Travel
//
//  Created by Kanokporn Wongwaitayakul on 16/2/2564 BE.
//

import Foundation

class LoginViewModel {
    
    func login(with username: String?, and password: String?) -> String? {
        
        if let username = username, let password = password {
            if let validPassword = Mock.users[username], validPassword == password {
                return nil
            }
        }

        return "Invalid password or username doesn't exist"
    }
    
}
