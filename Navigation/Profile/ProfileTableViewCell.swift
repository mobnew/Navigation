//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Alexey Kurazhov on 14.04.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    var cartoon: PostCartoon? {
        didSet {
            cartoonTitleLabel.text = cartoon?.author
            cartoonImageView.image = cartoon?.image
            cartoonDescriptionLabel.text = cartoon?.description
            likesLabel.text = "Likes: \(cartoon!.likes)"
            viewsLabel.text = "Views: \(cartoon!.views)"
            
        }
    }
    
    
    private let cartoonTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.numberOfLines = 2
        
        
        return label
    }()
    
    
    private var cartoonImageView: UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
   private let cartoonDescriptionLabel : UILabel = {
       let description = UILabel()
        description.font = UIFont.systemFont(ofSize: 14)
        description.translatesAutoresizingMaskIntoConstraints = false
        description.numberOfLines = 0
        description.textColor = .systemGray
        
    return description
    }()
    
    private let likesLabel : UILabel = {
       let likes = UILabel()
        likes.translatesAutoresizingMaskIntoConstraints = false
        likes.font = UIFont.systemFont(ofSize: 16)
        likes.textColor = .black
        
        return likes
    }()
    
    private let viewsLabel : UILabel = {
       let views = UILabel()
        views.translatesAutoresizingMaskIntoConstraints = false
        views.font = UIFont.systemFont(ofSize: 16)
        views.textColor = .black
        
        return views
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(cartoonTitleLabel)
        contentView.addSubview(cartoonImageView)
        contentView.addSubview(cartoonDescriptionLabel)
        contentView.addSubview(likesLabel)
        contentView.addSubview(viewsLabel)
        
        
        let constraints = [
            
            cartoonTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 16),
            cartoonTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            cartoonTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            cartoonTitleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor),

            
            
            cartoonImageView.topAnchor.constraint(equalTo: cartoonTitleLabel.bottomAnchor,constant: 16),
            cartoonImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cartoonImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cartoonImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor),
            cartoonImageView.widthAnchor.constraint(equalTo: cartoonImageView.heightAnchor),

            
            cartoonDescriptionLabel.topAnchor.constraint(equalTo: cartoonImageView.bottomAnchor,constant: 16),
            cartoonDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            cartoonDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
           
            
            
            likesLabel.topAnchor.constraint(equalTo: cartoonDescriptionLabel.bottomAnchor, constant: 16),
            likesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            
            viewsLabel.topAnchor.constraint(equalTo: cartoonDescriptionLabel.bottomAnchor, constant: 16),
            viewsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            viewsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
            
            
        ]
        
        NSLayoutConstraint.activate(constraints)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
