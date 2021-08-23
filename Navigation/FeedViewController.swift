//
//  ViewController.swift
//  Navigation
//
//  Created by Artem Novichkov on 12.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

final class FeedViewController: UIViewController {
    
    private let label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.text = "unknown"
        label.font = UIFont.systemFont(ofSize: 15)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let textfield: CustomTextField = {
       let tf = CustomTextField(sizeOfText: 17, placeHolder: "Check pass...")
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.black.cgColor
        
        return tf
    }()
    
    private lazy var checkButton: CustomButton = {
        let button = CustomButton(title: "Check Button", titleColor: .systemBlue) {
            [weak self] in self?.pressTwo() }
        
        return button
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        title = "Feed"
        
        NotificationCenter.default.addObserver(self, selector: #selector(okFunc), name: NSNotification.Name(rawValue: "ok") , object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(wrongFunc), name: NSNotification.Name(rawValue: "wrong") , object: nil)

        view.addSubview(checkButton)
        view.addSubview(label)
        view.addSubview(textfield)
        
        let constraints = [
            label.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            textfield.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            textfield.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textfield.widthAnchor.constraint(equalToConstant: 200),
            
            checkButton.topAnchor.constraint(equalTo: textfield.bottomAnchor, constant: 20),
            checkButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func pressTwo() {
        
        if textfield.text!.count < 1 {
            label.text = "empty"
            label.textColor = .black
        }
        else {model().checkWord(word: textfield.text!)}
    }
    
    @objc private func okFunc() {
        label.text = "OK"
        label.textColor = .systemGreen
    }
    
    @objc private func wrongFunc() {
        label.text = "Wrong"
        label.textColor = .systemRed
    }
}
