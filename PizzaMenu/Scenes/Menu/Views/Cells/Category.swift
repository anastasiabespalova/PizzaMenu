//
//  Category.swift
//  PizzaMenu
//
//  Created by Анастасия Беспалова on 12.12.2021.
//

import UIKit

class Category: UICollectionViewCell {
    
    var categoryLabel: UILabel! = {
        let label = UILabel()
        label.font = MenuConstants.categoryLabelFont
        label.textColor = MenuConstants.lightPinkColor
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.clipsToBounds = true
        self.isUserInteractionEnabled = true
        
        layer.cornerRadius = MenuConstants.categoryCornerRadius
        layer.borderWidth = MenuConstants.categoryBorderWidth
        layer.borderColor = MenuConstants.lightPinkColor.cgColor
        
        contentView.addSubview(categoryLabel)
        
        categoryLabel.snp.makeConstraints() {
            $0.center.equalTo(contentView.center)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLabel(_ category: String) {
        categoryLabel.text = category
    }
}
