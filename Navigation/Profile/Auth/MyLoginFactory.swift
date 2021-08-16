//
//  MyLoginFactory.swift
//  Navigation
//
//  Created by Alexey Kurazhov on 26.06.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation

class MyLoginFactory: LoginFactory {
    func getLoginInspector() -> LoginInspector {
        return LoginInspector()
    }
    
    
}
