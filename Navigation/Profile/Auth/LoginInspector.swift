//
//  LoginInspector.swift
//  Navigation
//
//  Created by Alexey Kurazhov on 26.06.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation

class LoginInspector: LoginViewControllerDelegate {
    func checkAuthData(user: String, pass: String) -> Bool {
        return Checker.shared.checkCreds(user: user, password: pass)
    }
}
