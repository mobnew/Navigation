//
//  Checker.swift
//  Navigation
//
//  Created by Alexey Kurazhov on 26.06.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation

class Checker {
    static let shared = Checker()
    
    private let login = "homer"
    private let pswd = "123"
    
    private init() {}
    
    func checkCreds(user: String, password: String) -> Bool {
        if user == login && password == pswd {
            print("Pass OK")
            return true
        } else {
            print("Pass wrong")
            return false
        }
    }
}
