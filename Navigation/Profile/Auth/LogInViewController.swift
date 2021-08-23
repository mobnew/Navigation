//
//  LogInViewController.swift
//  Navigation
//
//  Created by Alexey Kurazhov on 08.04.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
      
    var delegate: LoginViewControllerDelegate? = MyLoginFactory().getLoginInspector()
    
    
    //MARK: - SUbviews create
    private let scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let containerView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        return containerView
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "logo")
        
        return imageView
    }()
    
    private let containerEmailPassView: UIView = {
        let containerEmailPassView = UIView()
        containerEmailPassView.translatesAutoresizingMaskIntoConstraints = false
        containerEmailPassView.layer.borderWidth = 0.5
        containerEmailPassView.layer.borderColor = UIColor.lightGray.cgColor
        containerEmailPassView.layer.cornerRadius = 10
        containerEmailPassView.backgroundColor = .systemGray6
        
        return containerEmailPassView
    }()
    
    private lazy var button: CustomButton = {
        let button = CustomButton(title: "Log in", titleColor: .white) {
            [weak self] in self?.pushTheButton() }
        button.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel").alpha(1), for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        
        button.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel").alpha(0.8), for: .selected)
        button.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel").alpha(0.8), for: .highlighted)
        button.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel").alpha(0.8), for: .disabled)
        
       return button
    }()
    
    
    private let separator: UIView = {
       let separator = UIView()
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.layer.borderWidth = 0.25
        separator.layer.borderColor = UIColor.lightGray.cgColor
       
       return separator
    }()
    
    private let emailField: UITextField = {
       let emailField = UITextField()
        emailField.translatesAutoresizingMaskIntoConstraints = false
        emailField.textColor = .black
        emailField.font = UIFont.systemFont(ofSize: 16)
        emailField.autocapitalizationType = .none
        emailField.tintColor = UIColor(named: "ColorSet")
        
        
        return emailField
    }()
    
    private let passField: UITextField = {
       let passField = UITextField()
        passField.translatesAutoresizingMaskIntoConstraints = false
        passField.textColor = .black
        passField.font = UIFont.systemFont(ofSize: 16)
        passField.autocapitalizationType = .none
        passField.isSecureTextEntry = true
        passField.tintColor = UIColor(named: "ColorSet")
        
        return passField
    }()
    
    //MARK: - add subviews
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        
        containerView.addSubview(imageView)
        containerView.addSubview(containerEmailPassView)
        containerView.addSubview(button)
        
        containerEmailPassView.addSubview(separator)
        containerEmailPassView.addSubview(emailField)
        containerEmailPassView.addSubview(passField)
        
        // MARK: - constraints
        let constraints = [
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
                        
            imageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 120),
            imageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),
            
            containerEmailPassView.topAnchor.constraint(equalTo: imageView.bottomAnchor,constant: 120),
            containerEmailPassView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            containerEmailPassView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            containerEmailPassView.heightAnchor.constraint(equalToConstant: 100),
                       
            button.topAnchor.constraint(equalTo: containerEmailPassView.bottomAnchor, constant: 16),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            button.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
            separator.centerYAnchor.constraint(equalTo: containerEmailPassView.centerYAnchor),
            separator.leadingAnchor.constraint(equalTo: containerEmailPassView.leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: containerEmailPassView.trailingAnchor),
            separator.heightAnchor.constraint(equalToConstant: 0.5),
            
            emailField.topAnchor.constraint(equalTo: containerEmailPassView.topAnchor),
            emailField.leadingAnchor.constraint(equalTo: containerEmailPassView.leadingAnchor, constant: 10),
            emailField.trailingAnchor.constraint(equalTo: containerEmailPassView.trailingAnchor),
            emailField.bottomAnchor.constraint(equalTo: separator.topAnchor),
            
            passField.topAnchor.constraint(equalTo: separator.bottomAnchor),
            passField.leadingAnchor.constraint(equalTo: emailField.leadingAnchor),
            passField.trailingAnchor.constraint(equalTo: emailField.trailingAnchor),
            passField.bottomAnchor.constraint(equalTo: containerEmailPassView.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    // MARK: Keyboard notifications
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    // MARK: Actions
    @objc fileprivate func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            scrollView.contentInset.bottom = keyboardSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    
    @objc fileprivate func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }

   
    private func pushTheButton() {
        let loginField = emailField.text ?? "no user"
        let pswdField = passField.text ?? ""
        
        #if DEBUG
        let profileViewController = ProfileViewController(userService: TestUserService(), userName: loginField)
            navigationController?.pushViewController(profileViewController, animated: true)
        #else
        if delegate?.checkAuthData(user: loginField, pass: pswdField) == true  {
        let profileViewController = ProfileViewController(userService: CurrentUserService(), userName: loginField)
            navigationController?.pushViewController(profileViewController, animated: true)
        } else {
            print("Wrong creds")
        }
        #endif
        }
}

extension UIImage {
    func alpha(_ value:CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
