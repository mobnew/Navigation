//
//  MainTabbarController.swift
//  Navigation
//
//  Created by Alexey Kurazhov on 18.08.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class MainTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        view.backgroundColor = .white
        
        let firstVC = UINavigationController(rootViewController: FeedViewController())
        let icon1 = UITabBarItem(title: "Feed", image: UIImage(systemName: "house.fill"), selectedImage: UIImage(systemName: "house.fill"))
        firstVC.tabBarItem = icon1
        
        let secondVC = UINavigationController(rootViewController: LogInViewController())
        let icon2 = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.fill"), selectedImage: UIImage(systemName: "person.fill"))
        secondVC.tabBarItem = icon2
        self.viewControllers = [firstVC,secondVC]
    }
}
