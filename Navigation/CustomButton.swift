//
//  CustomButton.swift
//  Navigation
//
//  Created by Alexey Kurazhov on 19.08.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    var onTap: (() -> Void)
    
    init(title: String, titleColor: UIColor, onTap: @escaping (() -> Void)) {
        self.onTap = onTap
        
        super.init(frame: .zero)
        
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        translatesAutoresizingMaskIntoConstraints = false
        titleLabel?.font = UIFont.systemFont(ofSize: 17)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func buttonTapped(){
        onTap()
    }
}
