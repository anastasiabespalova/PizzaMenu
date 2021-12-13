//
//  BannersCategoriesView.swift
//  PizzaMenu
//
//  Created by Анастасия Беспалова on 12.12.2021.
//

import UIKit

protocol MenuSectionDelegate: AnyObject {
    func didSelectSegment(_ value: Categories)
}

class BannersCategoriesView: UIView {
    
    var bannerView: UIView!
    weak var delegate: MenuSectionDelegate?
    
    var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(Category.self, forCellWithReuseIdentifier: "Category")
        
        return collectionView
    }()
    
    private let categories = Categories.allCases
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        bannerView = BannersView()
        
        addSubview(bannerView)
        addSubview(collectionView)
        
        bannerView.snp.makeConstraints() {
            $0.top.equalTo(snp.top).offset(8)
            $0.left.equalTo(snp.left).offset(8)
            $0.right.equalTo(snp.right).offset(-8)
            $0.height.equalTo(MenuConstants.bannerHeight)
        }
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.snp.makeConstraints {
            $0.top.equalTo(bannerView.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(8)
            $0.trailing.equalToSuperview().offset(-8)
            $0.height.equalTo(MenuConstants.categoryHeight)
        }
        
        snp.makeConstraints{
            $0.height.equalTo(MenuConstants.headerHeight)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout extension

extension BannersCategoriesView: UICollectionViewDelegate,
                           UICollectionViewDataSource,
                           UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Category", for: indexPath) as? Category else { return .init() }
        
        cell.setLabel(categories[indexPath.row].getRussianName())
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: MenuConstants.categoryWidth, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectSegment(categories[indexPath.row])
    }
}

 
