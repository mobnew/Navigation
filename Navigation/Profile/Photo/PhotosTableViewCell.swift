//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Alexey Kurazhov on 21.04.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Photos"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        
        return label
    }()
    
    private let nextLabel: UILabel = {
        let label = UILabel()
        label.text = "\u{2794}"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let photoScrollView: UIScrollView = {
       let photo = UIScrollView()
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.showsVerticalScrollIndicator = false
        photo.showsHorizontalScrollIndicator = false
        
        return photo
    }()
    
    private let photo1: UIImageView = {
       let photo = UIImageView()
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.image = UIImage(named: "image-\(arc4random_uniform(20)+1)")
        photo.clipsToBounds = true
        photo.layer.cornerRadius = 6
        
        return photo
    }()
    
    private let photo2: UIImageView = {
       let photo = UIImageView()
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.image = UIImage(named: "image-\(arc4random_uniform(20)+1)")
        photo.clipsToBounds = true
        photo.layer.cornerRadius = 6
        
        return photo
    }()
    
    private let photo3: UIImageView = {
       let photo = UIImageView()
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.image = UIImage(named: "image-\(arc4random_uniform(20)+1)")
        photo.clipsToBounds = true
        photo.layer.cornerRadius = 6
        
        return photo
    }()
    
    private let photo4: UIImageView = {
       let photo = UIImageView()
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.image = UIImage(named: "image-\(arc4random_uniform(20)+1)")
        photo.clipsToBounds = true
        photo.layer.cornerRadius = 6
        
        return photo
    }()
    
    private let photo5: UIImageView = {
       let photo = UIImageView()
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.image = UIImage(named: "image-\(arc4random_uniform(20)+1)")
        photo.clipsToBounds = true
        photo.layer.cornerRadius = 6
        
        return photo
    }()
    
    private let photo6: UIImageView = {
       let photo = UIImageView()
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.image = UIImage(named: "image-\(arc4random_uniform(20)+1)")
        photo.clipsToBounds = true
        photo.layer.cornerRadius = 6
        
        return photo
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
     
        contentView.addSubview(titleLabel)
        contentView.addSubview(nextLabel)
        contentView.addSubview(photoScrollView)
        
        photoScrollView.addSubview(photo1)
        photoScrollView.addSubview(photo2)
        photoScrollView.addSubview(photo3)
        photoScrollView.addSubview(photo4)
        photoScrollView.addSubview(photo5)
        photoScrollView.addSubview(photo6)

        
        let constraints = ([
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),

            nextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            nextLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            
            
            photoScrollView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            photoScrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            photoScrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            photoScrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            photoScrollView.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25, constant: -12),
            
            photo1.topAnchor.constraint(equalTo: photoScrollView.topAnchor),
            photo1.leadingAnchor.constraint(equalTo: photoScrollView.leadingAnchor),
            photo1.bottomAnchor.constraint(equalTo: photoScrollView.bottomAnchor),
            photo1.heightAnchor.constraint(equalTo: photoScrollView.heightAnchor),
            photo1.widthAnchor.constraint(equalTo: photoScrollView.heightAnchor),
            
            photo2.topAnchor.constraint(equalTo: photoScrollView.topAnchor),
            photo2.leadingAnchor.constraint(equalTo: photo1.trailingAnchor, constant: 8),
            photo2.bottomAnchor.constraint(equalTo: photoScrollView.bottomAnchor),
            photo2.heightAnchor.constraint(equalTo: photoScrollView.heightAnchor),
            photo2.widthAnchor.constraint(equalTo: photoScrollView.heightAnchor),
            
            photo3.topAnchor.constraint(equalTo: photoScrollView.topAnchor),
            photo3.leadingAnchor.constraint(equalTo: photo2.trailingAnchor, constant: 8),
            photo3.bottomAnchor.constraint(equalTo: photoScrollView.bottomAnchor),
            photo3.heightAnchor.constraint(equalTo: photoScrollView.heightAnchor),
            photo3.widthAnchor.constraint(equalTo: photoScrollView.heightAnchor),
            
            photo4.topAnchor.constraint(equalTo: photoScrollView.topAnchor),
            photo4.leadingAnchor.constraint(equalTo: photo3.trailingAnchor, constant: 8),
            photo4.bottomAnchor.constraint(equalTo: photoScrollView.bottomAnchor),
            photo4.heightAnchor.constraint(equalTo: photoScrollView.heightAnchor),
            photo4.widthAnchor.constraint(equalTo: photoScrollView.heightAnchor),
            
            photo5.topAnchor.constraint(equalTo: photoScrollView.topAnchor),
            photo5.leadingAnchor.constraint(equalTo: photo4.trailingAnchor, constant: 8),
            photo5.bottomAnchor.constraint(equalTo: photoScrollView.bottomAnchor),
            photo5.heightAnchor.constraint(equalTo: photoScrollView.heightAnchor),
            photo5.widthAnchor.constraint(equalTo: photoScrollView.heightAnchor),
            
            photo6.topAnchor.constraint(equalTo: photoScrollView.topAnchor),
            photo6.leadingAnchor.constraint(equalTo: photo5.trailingAnchor, constant: 8),
            photo6.bottomAnchor.constraint(equalTo: photoScrollView.bottomAnchor),
            photo6.heightAnchor.constraint(equalTo: photoScrollView.heightAnchor),
            photo6.widthAnchor.constraint(equalTo: photoScrollView.heightAnchor),
            photo6.trailingAnchor.constraint(equalTo: photoScrollView.trailingAnchor)
            
            

            
        ])
        NSLayoutConstraint.activate(constraints)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
