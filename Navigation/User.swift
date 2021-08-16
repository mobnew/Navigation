//
//  User.swift
//  Navigation
//
//  Created by Alexey Kurazhov on 22.06.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class User {
    var fullName: String
    var avatar: UIImage
    var status: String
    
    init(fullName: String, avatar: UIImage, status: String) {
        self.fullName = fullName
        self.avatar = avatar
        self.status = status
    }
}

protocol UserService {
    func getUserObject(name: String) -> User
}

class CurrentUserService: UserService {
    func getUserObject(name: String) -> User {
        if name == "homer" {
           return User(fullName: "Homer Simpson", avatar: #imageLiteral(resourceName: "h2"), status: "Ho-Ho-Ho")
        } else {
           return User(fullName: "no user", avatar: #imageLiteral(resourceName: "no"), status: "No-No-No")
        }
    }
}

class TestUserService: UserService {
    func getUserObject(name: String) -> User {
        return User(fullName: "testUser", avatar: #imageLiteral(resourceName: "deb"), status: "Debug status")
    }
}
