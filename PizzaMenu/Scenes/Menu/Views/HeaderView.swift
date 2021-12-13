//
//  HeaderView.swift
//  PizzaMenu
//
//  Created by Анастасия Беспалова on 12.12.2021.
//

import UIKit

protocol MenuSectionDelegate: AnyObject {
    func didSelectSegment(_ value: Categories)
}

class HeaderView: UIView {
    
    var bannerView: UIView!
    weak var delegate: MenuSectionDelegate?
    
    var previousSelected : IndexPath?
    var currentSelected : Int?
    
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

extension HeaderView: UICollectionViewDelegate,
                      UICollectionViewDataSource,
                      UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Category", for: indexPath) as? Category else { return .init() }
        
        cell.setLabel(categories[indexPath.row].getRussianName())
        
        if currentSelected != nil && currentSelected == indexPath.row
        {
                cell.backgroundColor = MenuConstants.lightPinkColor
                cell.categoryLabel.font = MenuConstants.categoryLabelSelectedFont
                cell.categoryLabel.textColor = MenuConstants.brightPinkColor
        }else{
            
            cell.backgroundColor = UIColor.white
            cell.categoryLabel.font = MenuConstants.categoryLabelUnselectedFont
            cell.categoryLabel.textColor = MenuConstants.lightPinkColor
            
        }
        
        return cell
    }
    
    func highlightCategory(index: Int) {
        currentSelected = index
        
        if currentSelected != previousSelected?.row {
            previousSelected = IndexPath(row: index, section: 0)
            self.collectionView.reloadItems(at: [IndexPath(row: 0, section: 0),
                                                 IndexPath(row: 1, section: 0),
                                                 IndexPath(row: 2, section: 0),
                                                 IndexPath(row: 3, section: 0)])
        }
       
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: MenuConstants.categoryWidth, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if previousSelected != nil{
            if let cell = collectionView.cellForItem(at: previousSelected!) as? Category {
                cell.backgroundColor = UIColor.white
                cell.categoryLabel.font = MenuConstants.categoryLabelUnselectedFont
                cell.categoryLabel.textColor = MenuConstants.lightPinkColor
            }
        }
        currentSelected = indexPath.row
        previousSelected = indexPath
        self.collectionView.reloadItems(at: [indexPath])
        delegate?.didSelectSegment(categories[indexPath.row])
    }
}

 
