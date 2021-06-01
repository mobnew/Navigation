//
//  ProfileTableHederView.swift
//  Navigation
//
//  Created by Alexey Kurazhov on 15.04.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit
import SnapKit

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
        
        profileHeaderView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(220)
        }
        
        image.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(16)
            make.height.width.equalTo(100)
        }
        
        labelName.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(27)
            make.leading.equalTo(image.snp.trailing).offset(20)
        }
        
        button.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(36)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(50)
        }
        
        textField.snp.makeConstraints { make in
            make.leading.equalTo(image.snp.trailing).offset(20)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(40)
            make.bottom.equalTo(button.snp.top).offset(-16)
        }
        
        labelStatus.snp.makeConstraints { make in
            make.leading.equalTo(textField.snp.leading)
            make.bottom.equalTo(textField.snp.top).offset(-16)
        }
        
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




