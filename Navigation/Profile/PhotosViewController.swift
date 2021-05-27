//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Alexey Kurazhov on 21.04.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {

    private let cellID = "cell"
    
    private let collectView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collect = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collect.backgroundColor = .white
        collect.translatesAutoresizingMaskIntoConstraints = false
      return collect
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.addSubview(collectView)
        view.backgroundColor = .white
        
        title = "Photo Galery"
        
        collectView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        collectView.dataSource = self
        collectView.delegate = self
        
        
        let constraints = ([
            collectView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

        NSLayoutConstraint.activate(constraints)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    

    

}


extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PhotoStorage.collectionModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PhotosCollectionViewCell
        
        myCell.photoView.image = PhotoStorage.collectionModel[indexPath.row].image
        
        return myCell
    }
    
}
    
    
extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: (collectionView.bounds.width - 32) / 3, height: (collectionView.bounds.width - 32) / 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 8
        }

}
