//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Alexey Kurazhov on 14.04.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit
import StorageService

class ProfileViewController: UIViewController {
    
    private let headerView = ProfileTableHederView()
    
    
//    MARK: - Слои и кнопки
    
    private let transptView: UIView = {
       let transprt = UIView()
        transprt.translatesAutoresizingMaskIntoConstraints = false
        transprt.backgroundColor = UIColor.systemGray.withAlphaComponent(0)
        
        
        return transprt
    }()
    
    
    
    private let closeButton: UIButton = {
        let button = UIButton(type: .close)
        button.frame = CGRect(
            x: UIScreen.main.bounds.width - 55,
            y: 35,
            width: 50,
            height: 50)
        button.alpha = 0
        
        
        return button
    }()
    
    private let secondAvatar: UIImageView = {
        let image = UIImageView()
        
        
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "homer")
        
        image.layer.cornerRadius = 100 / 2
        image.clipsToBounds = true
        
        image.layer.borderWidth = 3
        image.layer.backgroundColor = UIColor.white.cgColor
        image.layer.borderColor = UIColor.white.cgColor
        image.frame = CGRect(
            x: 16,
            y: 16,
            width: 100,
            height: 100)
        image.alpha = 0

        
        
        return image
    }()
    
    
    private let tableView = UITableView(frame: .zero, style: .grouped)
    private let reuseId = "cell"
    private let newID = "newID"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        #if DEBUG
        tableView.backgroundColor = .white
        #else
        tableView.backgroundColor = .red
        #endif
        
        setupConstraints()
        setupTableView()
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        
        
        headerView.image.isUserInteractionEnabled = true
        
        let tapAvatar = UITapGestureRecognizer(target: self, action: #selector(tap))
        headerView.image.addGestureRecognizer(tapAvatar)
        
        let cancelTap = UITapGestureRecognizer(target: self, action: #selector(closeFunc))
             closeButton.addGestureRecognizer(cancelTap)
    }
    
//    MARK: Настройки таблицы
    private func setupTableView() {
        tableView.register(ProfileTableHederView.self, forHeaderFooterViewReuseIdentifier: String(describing: ProfileTableHederView.self))
        
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: newID)
        
        tableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: reuseId)

        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    private func setupConstraints() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
   
}

//MARK: Расширения

extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return Storage.tableModel.count
        default:
            break
        }
        
        return section
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: newID, for: indexPath) as! PhotosTableViewCell
            
            
            return cell
            
        }
        
        
        else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath) as! ProfileTableViewCell
            
            let cartoon = Storage.tableModel[indexPath.row]
            cell.cartoon = cartoon
            
            return cell
        }
        

        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    

}


extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
            return headerView

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 0 {
            let photoVC = PhotosViewController()
            navigationController?.pushViewController(photoVC, animated: true)
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 220
        default:
            return .zero
        }
    }

//   MARK: Функции
    
    @objc func tap() {

        let backgroundAnimation = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn) {
                   
            self.headerView.addSubview(self.transptView)
            self.transptView.alpha = 1
                   
            self.transptView.backgroundColor = UIColor.systemGray.withAlphaComponent(0.5)
            self.transptView.frame = .init(
                x: 0,
                y: 0,
                width: self.view.frame.width,
                height: self.view.frame.height)
            
            self.transptView.addSubview(self.secondAvatar)
            self.secondAvatar.alpha = 1
            self.secondAvatar.frame = .init(
                x: 0,
                y: (self.view.frame.height / 2) - (self.view.frame.width / 2),
                width: self.view.frame.width,
                height: self.view.frame.width)
            self.secondAvatar.layer.cornerRadius = 0
            
            
               }
        let doCancelButton = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut) {

            self.headerView.addSubview(self.closeButton)
            self.closeButton.alpha = 1
            
            self.closeButton.frame = .init(
                x: self.view.frame.width - 55,
                y: 35,
                width: 50,
                height: 50)
        }
               
        
        backgroundAnimation.startAnimation()
        doCancelButton.startAnimation(afterDelay: 0.5)
        
    }
    
    
    @objc func closeFunc() {
        let         backImageAnimation = UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut) {
            self.secondAvatar.frame = .init(x: 16, y: 16, width: 100, height: 100)
            self.secondAvatar.layer.cornerRadius = 50
            
            
            self.transptView.alpha = 0
            self.closeButton.alpha = 0
         }
        
        
        backImageAnimation.startAnimation()
    }
}


