//
//  LoginFactory.swift
//  Navigation
//
//  Created by Alexey Kurazhov on 26.06.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation

protocol LoginFactory {
    func getLoginInspector() -> LoginInspector
}
