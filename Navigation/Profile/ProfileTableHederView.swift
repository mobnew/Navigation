//
//  ProfileTableHederView.swift
//  Navigation
//
//  Created by Alexey Kurazhov on 15.04.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit


class ProfileTableHederView: UITableViewHeaderFooterView {
    
     let profileHeaderView: UIView = {
            let profileHV = UIView()
            profileHV.backgroundColor = .lightGray
            profileHV.translatesAutoresizingMaskIntoConstraints = false
        
            return profileHV
        }()
    
    
     let image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "homer")
        
        image.layer.cornerRadius = 100 / 2
        image.clipsToBounds = true
        
        image.layer.borderWidth = 3
        image.layer.backgroundColor = UIColor.white.cgColor
        image.layer.borderColor = UIColor.white.cgColor

        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    
    private let labelName: UILabel = {
        let labelName = UILabel()
        labelName.text = "Homer Simpson"
        labelName.font = UIFont.boldSystemFont(ofSize: 18)
        labelName.textColor = .black
        labelName.textAlignment = .left
        labelName.translatesAutoresizingMaskIntoConstraints = false
        
        return labelName
    }()
    
    private let button: UIButton = {
       let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Set status", for: .normal)
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.cornerRadius = 4
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        return button
    
    }()
    
    
    private let labelStatus: UILabel = {
        let labelStatus = UILabel()
        labelStatus.text = "Waiting for something..."
        labelStatus.font = UIFont.systemFont(ofSize: 14)
        labelStatus.textColor = .darkGray
        labelStatus.textAlignment = .left
        labelStatus.translatesAutoresizingMaskIntoConstraints = false
        
        return labelStatus
    }()
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.textColor = .black
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        
        
        return textField
    }()
    
    private var statusText: String  = ""
    
    
    override init(reuseIdentifier: String?) {
           super.init(reuseIdentifier: reuseIdentifier)
        
        
        contentView.addSubview(profileHeaderView)
        profileHeaderView.addSubview(image)
        profileHeaderView.addSubview(labelName)
        profileHeaderView.addSubview(button)
        profileHeaderView.addSubview(textField)
        profileHeaderView.addSubview(labelStatus)
        
        
        
        
        
        let constraints = [
            profileHeaderView.topAnchor.constraint(equalTo: contentView.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            image.heightAnchor.constraint(equalToConstant: 100),
            image.widthAnchor.constraint(equalTo: image.heightAnchor),
            
            labelName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 27),
            labelName.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 20),
            
            button.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 36),
            button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            button.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -16 * 2),
            button.heightAnchor.constraint(equalToConstant: 50),
            
            textField.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            textField.heightAnchor.constraint(equalToConstant: 40),
            textField.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -16),
            
            labelStatus.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
            labelStatus.bottomAnchor.constraint(equalTo: textField.topAnchor, constant: -16)
            
        ]
        
        NSLayoutConstraint.activate(constraints)
        
        
        
       }
       

       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
    @objc func buttonPressed() {
        labelStatus.text = statusText
        
    }
    
    @objc func statusTextChanged() {
        statusText = textField.text ?? "No text"
        
    }
    
    
}




