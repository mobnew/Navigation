//
//  ViewController.swift
//  Navigation
//
//  Created by Artem Novichkov on 12.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

final class FeedViewController: UIViewController {
    
    let post: Post = Post(title: "Пост")
    
    lazy var firstButton: CustomButton = {
        let button = CustomButton(title: "One Button", titleColor: .systemBlue, onTap: pressOne)
        
        return button
    }()
    
    lazy var secondButton: CustomButton = {
        let button = CustomButton(title: "Two Button", titleColor: .systemBlue, onTap: pressTwo)
        
        return button
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .systemGreen
        title = "Feed"
        
        view.addSubview(firstButton)
        view.addSubview(secondButton)
        
        let constraints = [
            firstButton.topAnchor.constraint(equalTo: view.centerYAnchor ,constant: 15),
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 10),
            secondButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func pressOne() {
        let postVC = PostViewController()
        postVC.post = post
        self.show(postVC, sender: nil)
    }
    
    func pressTwo() {
        let postVC = PostViewController()
        postVC.post = Post(title: "Post")
        self.show(postVC, sender: nil)
    }
}
