//
//  CustomTextField.swift
//  Navigation
//
//  Created by Alexey Kurazhov on 19.08.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {

    init(sizeOfText: Int, placeHolder: String) {
        super.init(frame: .zero)
        placeholder = placeHolder
        font = UIFont.systemFont(ofSize: CGFloat(sizeOfText))
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
