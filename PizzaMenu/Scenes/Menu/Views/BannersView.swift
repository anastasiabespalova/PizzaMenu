//
//  BannersView.swift
//  PizzaMenu
//
//  Created by Анастасия Беспалова on 12.12.2021.
//

import UIKit
import SnapKit

class BannersView: UIView {
    
    var collectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(Banner.self, forCellWithReuseIdentifier: "Banner")
        collectionView.showsHorizontalScrollIndicator = false
        
        addSubview(collectionView)
        
        collectionView.snp.makeConstraints() {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout methods

extension BannersView: UICollectionViewDelegate,
                      UICollectionViewDataSource,
                      UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MenuConstants.bannerCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Banner", for: indexPath) as? Banner else { return .init() }
        cell.setImage(indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.width * MenuConstants.bannerWidthMultiplier,
                      height: collectionView.bounds.height * MenuConstants.bannerHeightMultiplier)
    }
}
