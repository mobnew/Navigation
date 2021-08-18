//
//  FeedNaviController.swift
//  Navigation
//
//  Created by Alexey Kurazhov on 18.08.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class FeedNaviController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let feedVC = FeedViewController()
        self.viewControllers = [feedVC]
    }
}
