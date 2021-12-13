//
//  Banner.swift
//  PizzaMenu
//
//  Created by Анастасия Беспалова on 12.12.2021.
//

import UIKit

class Banner: UICollectionViewCell {
    
    let bannerPhoto: UIImageView! = {
          let imageView = UIImageView()
          return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(bannerPhoto)
        
        bannerPhoto.snp.makeConstraints() {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        self.clipsToBounds = true
        layer.cornerRadius = MenuConstants.bannerCornerRadius
       }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImage(_ indexPath: IndexPath) {
        bannerPhoto.image = UIImage(named: "banner\(indexPath.row + 1)")
    }
}
